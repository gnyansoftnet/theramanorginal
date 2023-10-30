import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/authentication/presentation/controller/login_controller.dart';
import 'package:theraman/src/features/authentication/presentation/widget/send_otp_button.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "MobileNumberRoute")
class MobileNumberScreen extends ConsumerWidget {
  final String userType;
  MobileNumberScreen({super.key, required this.userType});
  TextEditingController mobileNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = LoginController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(
                      fit: BoxFit.cover,
                      height: 200,
                      image: AssetImage("assets/images/harmoney_logo.png")),
                  gapH16,
                  Card(
                    elevation: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1))),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "+91 |",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                              child: Form(
                            key: _formKey,
                            child: TextFormField(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                              controller: mobileNoController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter your number",
                                border: InputBorder.none,
                                fillColor: Colors.white.withOpacity(0.2),
                                disabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                  gapH16,
                  SendOtpButton(
                      mobileNoController: mobileNoController,
                      usertype: userType,
                      onSubmit: () {
                        if (isValidated()) {
                          loginController.login(
                              ref: ref,
                              mobileNumber: mobileNoController.text,
                              userType: userType);
                        }
                      })
                ],
              ),
            )),
      ),
    );
  }

  bool isValidated() {
    if (mobileNoController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please enter your mobile number',
      );
      return false;
    } else if (mobileNoController.text.length < 10) {
      Fluttertoast.showToast(
        msg: 'Mobile number must be 10 digit',
      );
      return false;
    }
    return true;
  }
}
