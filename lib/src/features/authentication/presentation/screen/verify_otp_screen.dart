import 'dart:async';
import 'dart:io';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:theraman/src/features/authentication/presentation/controller/login_controller.dart';

import '../../../../utils/constants/gaps.dart';
import '../../application/providers/login_provider.dart';
import '../widget/verify_otp_button.dart';

@RoutePage(deferredLoading: true, name: "VarifyOtpRoute")
class VerifyOtpScreen extends ConsumerStatefulWidget {
  final TextEditingController mobileNoController;
  final String userType;
  const VerifyOtpScreen(
      {super.key, required this.mobileNoController, required this.userType});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  TextEditingController pinController = TextEditingController();
  final loginController = LoginController();

  int _secondsRemaining = 30;
  late Timer _timer;
  bool isResend = false;
  String? otpText;

  @override
  void initState() {
    super.initState();
    fetchAutoOTPFromPhone();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                    fit: BoxFit.cover,
                    height: 200,
                    image: AssetImage("assets/images/harmoney_logo.png")),
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
                  onTextChanged: (text) {
                    if (text.length == 4) {
                      otpText = text;
                    }
                  },
                  onDone: (pin) {},
                ),
                gapH16,
                AutoSizeText(
                    "OTP sent to this No. +91${widget.mobileNoController.text}"),
                gapH20,
                VerifyOtpButton(onSubmit: () {
                  if (isValidated()) {
                    loginController.verifyOtp(
                        ref: ref,
                        mobileNumber: widget.mobileNoController.text,
                        otp: pinController.text,
                        userType: widget.userType);
                  }
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (isResend) {
                            setState(() {
                              isResend = false;
                              _secondsRemaining = 30;
                            });
                            ref.read(sendOtpProvider.notifier).sendOtp(
                                mobileNo: widget.mobileNoController.text,
                                userType: widget.userType);
                            fetchAutoOTPFromPhone();
                            _startTimer();
                          } else {
                            setState(() {
                              isResend = false;
                              _secondsRemaining = 30;
                            });
                          }
                        },
                        child: AutoSizeText(
                          "Resend OTP",
                          style: TextStyle(
                              color: isResend ? Colors.blue : Colors.black,
                              fontWeight: isResend
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        )),
                    gapW4,
                    isResend
                        ? Container()
                        : AutoSizeText(
                            "$_secondsRemaining sec",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  bool isValidated() {
    if (pinController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Please enter  OTP',
      );
      return false;
    } else if (pinController.text.length < 4) {
      Fluttertoast.showToast(
        msg: 'OTP Must be 4 digit',
      );
      return false;
    }
    return true;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
          setState(() {
            isResend = false;
          });
        } else {
          setState(() {
            isResend = true;
          });
          _timer.cancel();
        }
      });
    });
  }

  void fetchAutoOTPFromPhone() async {
    if (Platform.isAndroid) {
      String commingSms;
      try {
        commingSms = await AltSmsAutofill().listenForSms ?? "";
        pinController.text = commingSms.toString().split(" ")[10];
        otpText = commingSms.toString().split(" ")[2];
      } on PlatformException {}
    }
  }

  @override
  void dispose() {
    pinController.clear();
    AltSmsAutofill().unregisterListener();
    _timer.cancel();
    super.dispose();
  }
}
