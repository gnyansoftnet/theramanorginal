import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/authentication/application/providers/login_provider.dart';
import 'package:theraman/src/features/authentication/screen/send_otp_button.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "LoginRoute")
class LoginScreen extends ConsumerWidget {
  final String userType;
  LoginScreen({super.key, required this.userType});
  TextEditingController mobileNoController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
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
                            child: AutoSizeText(
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
                        login(ref);
                      })
                ],
              ),
            )),
      ),
    );
  }

  void login(WidgetRef ref) {
    if (mobileNoController.text.isEmpty ||
        mobileNoController.text.length < 10) {
      Fluttertoast.showToast(
        msg: 'Please enter your mobile number',
      );
    } else {
      ref
          .read(sendOtpProvider.notifier)
          .sendOtp(mobileNo: mobileNoController.text, userType: userType);
    }
  }
}
