import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/send_otp_notifier.dart';
import 'package:theraman/src/features/authentication/application/notifiers/verify_otp_notifier.dart';
import 'package:theraman/src/features/authentication/application/states/send_otp_states.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';

final sendOtpProvider =
    AutoDisposeAsyncNotifierProvider<SendOtpNotifier, SendOtpState>(
  () => SendOtpNotifier(),
  name: "loginProvider",
);
final verifyOtpProvider =
    AutoDisposeAsyncNotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  () => VerifyOtpNotifier(),
  name: "verifyOtpProvider",
);
