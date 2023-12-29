import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

import '../../data/repo/auth_repo_pod.dart';

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
    final result = await ref.watch(authRepoProvider).verifyOtp(
        mobileNo: mobileNo,
        otp: otp,
        userType: userType,
        cancelToken: ref.cancelToken());

    result.when(
      (userModel) {
        // state = AsyncData(VerifyOtpLoaded(userModel: userModel));
        state = const AsyncData(VerifyOtpLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
