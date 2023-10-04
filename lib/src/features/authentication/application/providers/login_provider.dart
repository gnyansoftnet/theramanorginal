import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/send_otp_notifier.dart';
import 'package:theraman/src/features/authentication/application/states/send_otp_states.dart';

final loginProvider =
    AutoDisposeAsyncNotifierProvider<SendOtpNotifier, SendOtpState>(
  () => SendOtpNotifier(),
  name: "loginProvider",
);
