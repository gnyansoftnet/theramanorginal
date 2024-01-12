import 'dart:io';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:theraman/src/global/exception/app_exception.dart';
import 'package:theraman/src/features/authentication/application/providers/timer_provider.dart';
import 'package:theraman/src/features/authentication/application/providers/send_otp_provider.dart';
import 'package:theraman/src/features/authentication/presentation/controller/auth_controller.dart';
import 'package:theraman/src/features/authentication/presentation/comp/verify_otp_button.dart';
import 'package:theraman/src/utils/constants/app_assets.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';
import 'package:theraman/src/utils/constants/gaps.dart';

@RoutePage(deferredLoading: true, name: "VerifyOtpRoute")
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
  final loginController = AuthController();

  final ValueNotifier<bool> isResend = ValueNotifier<bool>(false);

  String? otpText;

  @override
  void initState() {
    super.initState();
    fetchAutoOTPFromPhone();
  }

  @override
  Widget build(BuildContext context) {
    final timeState = ref.watch(timerProvider);
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          children: [
            const Image(fit: BoxFit.contain, image: AssetImage(AppAssets.logo)),
            Text("Verify your OTP",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
            gap16,
            Center(
              child: PinCodeTextField(
                pinBoxRadius: 10,
                defaultBorderColor: Colors.black.withOpacity(0.5),
                controller: pinController,
                maxLength: 4,
                hasError: false,
                hideCharacter: false,
                pinBoxWidth: 60,
                pinBoxHeight: 60,
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                pinTextAnimatedSwitcherDuration:
                    const Duration(milliseconds: 300),
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
            ),
            gap16,
            Text(
              "OTP sent to this No. +91${widget.mobileNoController.text}",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            gap20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: VerifyOtpButton(onSubmit: () {
                if (isValidated()) {
                  loginController.verifyOtp(
                      ref: ref,
                      mobileNumber: widget.mobileNoController.text,
                      otp: pinController.text,
                      userType: widget.userType);
                }
              }),
            ),
            gap40,
            ValueListenableBuilder(
                valueListenable: isResend,
                builder: (context, value, _) {
                  if (timeState == 0) {
                    isResend.value = true;
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: isResend.value
                              ? () {
                                  isResend.value = false;
                                  ref.read(sendOtpProvider.notifier).sendOtp(
                                      mobileNo: widget.mobileNoController.text,
                                      userType: widget.userType);
                                  ref.read(timerProvider.notifier).resetTimer();
                                  fetchAutoOTPFromPhone();
                                }
                              : null,
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                                color:
                                    isResend.value ? Colors.blue : Colors.black,
                                fontWeight: isResend.value
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                          )),
                      gap4,
                      Text(
                        isResend.value ? "" : "$timeState Sec",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  );
                })
          ],
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

  void fetchAutoOTPFromPhone() async {
    if (Platform.isAndroid) {
      String commingSms;
      try {
        commingSms = await AltSmsAutofill().listenForSms ?? "";
        pinController.text = commingSms.toString().split(" ")[10];
        otpText = commingSms.toString().split(" ")[2];
      } on PlatformException {
        AppException("Can not fetch otp");
      }
    }
  }

  @override
  void dispose() {
    pinController.clear();
    AltSmsAutofill().unregisterListener();
    super.dispose();
  }
}
