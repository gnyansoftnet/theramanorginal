import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/states/send_otp_states.dart';
import 'package:theraman/src/features/authentication/data/repo/login_repo_pod.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';

class SendOtpNotifier extends AutoDisposeAsyncNotifier<SendOtpState> {
  @override
  FutureOr<SendOtpState> build() {
    state = const AsyncData(SendOtpInitial());
    return future;
  }

  Future<void> sendOtp({required mobileNo, required userType}) async {
    state = const AsyncLoading();
    final result = await ref.watch(loginRepoProvider).sendOtp(
        mobileNo: mobileNo, userType: userType, cancelToken: ref.cancelToken());

    result.when(
      (sucess) {
        state = const AsyncData(SendOtpLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
