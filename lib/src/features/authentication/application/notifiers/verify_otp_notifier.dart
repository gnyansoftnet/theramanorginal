import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';

import '../../data/repo/login_repo_pod.dart';

class VerifyOtpNotifier extends AutoDisposeAsyncNotifier<VerifyOtpState> {
  @override
  FutureOr<VerifyOtpState> build() {
    state = const AsyncData(VerifyOtpInitial());
    return future;
  }

  Future<void> verifyOtp({
    required mobileNo,
    required otp,
    required userType,
  }) async {
    state = const AsyncLoading();
    final result = await ref
        .watch(loginRepoProvider)
        .verifyOtp(mobileNo: mobileNo, otp: otp, userType: userType);

    result.when(
      (foodItem) {
        state = const AsyncData(VerifyOtpLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
