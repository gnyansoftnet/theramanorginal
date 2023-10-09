import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/login_provider.dart';

class LoginController {
  void login(
      {required WidgetRef ref,
      required String mobileNumber,
      required String userType}) {
    ref
        .read(sendOtpProvider.notifier)
        .sendOtp(mobileNo: mobileNumber, userType: userType);
  }

  void verifyOtp(
      {required WidgetRef ref,
      required String mobileNumber,
      required String otp,
      required String userType}) {
    ref
        .read(verifyOtpProvider.notifier)
        .verifyOtp(mobileNo: mobileNumber, otp: otp, userType: userType);
  }
}
