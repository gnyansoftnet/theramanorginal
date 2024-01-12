import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/authentication/application/states/verify_otp_states.dart';
import 'package:theraman/src/features/authentication/data/repo/auth_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

class VerifyOtpNotifier extends AutoDisposeAsyncNotifier<VerifyOtpState> {
  @override
  FutureOr<VerifyOtpState> build() {
    state = const AsyncData(VerifyOtpInitial());
    return future;
  }

  Future<void> verifyOtp({
    required String mobileNo,
    required String otp,
    required String userType,
  }) async {
    state = const AsyncLoading();
    final result = await ref.watch(authRepoProvider).verifyOtp(
        mobileNo: mobileNo,
        otp: otp,
        userType: userType,
        cancelToken: ref.cancelToken());

    result.when(
      (success) {
        ref.read(userProvider.notifier).saveUser(
            userModel: success.copyWith(userType: userType, isLogin: true));
        state = const AsyncData(VerifyOtpLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
