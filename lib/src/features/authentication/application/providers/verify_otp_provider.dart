import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/verify_otp_notifier.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';

final verifyOtpProvider =
    AutoDisposeAsyncNotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  () => VerifyOtpNotifier(),
  name: "verifyOtpProvider",
);
