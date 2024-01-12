import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:theraman/src/features/authentication/presentation/controller/auth_controller.dart';
import 'package:theraman/src/features/authentication/presentation/comp/send_otp_button.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "MobileNumberRoute")
class MobileNumberScreen extends ConsumerWidget {
  final String userType;
  MobileNumberScreen({super.key, required this.userType});
  final mobileNoController = TextEditingController();
  final loginController = AuthController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const Image(
                fit: BoxFit.contain,
                height: 300,
                image: AssetImage(AppAssets.logo)),
            gap16,
            const Text(
              "Enter Your Resister Mobile Number",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            gap16,
            Card(
              elevation: 2.0,
              color: Theme.of(context).inputDecorationTheme.fillColor,
              margin: EdgeInsets.zero,
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      width: 1)),
              shadowColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text(
                      "+91 |",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Expanded(
                        child: TextFormField(
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      controller: mobileNoController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Mobile Number",
                          border: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ))
                  ],
                ),
              ),
            ),
            gap40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: SendOtpButton(
                  mobileNoController: mobileNoController,
                  usertype: userType,
                  onSubmit: () {
                    if (isValidated()) {
                      loginController.sendOtp(
                          ref: ref,
                          mobileNumber: mobileNoController.text,
                          userType: userType);
                    }
                  }),
            )
          ],
        ),
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
