import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:theraman/src/features/authentication/application/providers/login_provider.dart';
import 'package:theraman/src/features/authentication/application/providers/timer_provider.dart';
import 'package:theraman/src/features/authentication/screen/verify_otp_button.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "VarifyOtpRoute")
class VerifyOtpScreen extends ConsumerWidget {
  final TextEditingController mobileNoController;
  final String userType;
  VerifyOtpScreen(
      {super.key, required this.mobileNoController, required this.userType});

  TextEditingController pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              const CircleAvatar(
                  radius: 85,
                  backgroundImage:
                      AssetImage("assets/images/harmoney_logo.jpg")),
              gapH20,
              const AutoSizeText(
                "Verify your OTP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              gapH16,
              PinCodeTextField(
                pinBoxRadius: 10,
                // hasTextBorderColor: Colors.white10,
                // highlightColor: Colors.white10,
                defaultBorderColor: Colors.black.withOpacity(0.5),
                controller: pinController,
                maxLength: 4,
                hasError: false,
                hideCharacter: false,
                pinBoxWidth: 50,
                pinBoxHeight: 50,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                //                    pinBoxColor: Colors.green[100],
                pinTextAnimatedSwitcherDuration:
                    const Duration(milliseconds: 300),
                //                    highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.number,
                wrapAlignment: WrapAlignment.center,
                pinTextStyle:
                    const TextStyle(fontSize: 17, color: Colors.black),
                onTextChanged: (text) {},
                onDone: (pin) {
                  print("Completed: $pin");
                },
              ),
              gapH16,
              AutoSizeText(
                  "OTP sent to this No. +91${mobileNoController.text}"),
              gapH20,
              VerifyOtpButton(onSubmit: () {
                verifyOtp(ref);
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AutoSizeText("Resend OTP"),
                  Consumer(builder: (context, ref, _) {
                    final timeState = ref.watch(timerProvider);
                    return AutoSizeText(timeState.toString());
                  })
                ],
              )
            ],
          ),
        ));
  }

  void verifyOtp(WidgetRef ref) {
    if (pinController.text.isEmpty || mobileNoController.text.isEmpty) {
      Fluttertoast.showToast(msg: "please enter otp");
    } else {
      ref.read(verifyOtpProvider.notifier).verifyOtp(
          mobileNo: mobileNoController.text,
          otp: pinController.text,
          userType: userType);
    }
  }
}
