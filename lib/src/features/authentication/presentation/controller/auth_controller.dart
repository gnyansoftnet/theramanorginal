import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/send_otp_provider.dart';
import 'package:theraman/src/features/authentication/application/providers/verify_otp_provider.dart';

class AuthController {
  void sendOtp(
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
