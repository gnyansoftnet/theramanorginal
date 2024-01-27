import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/authentication/application/states/signin_state.dart';
import 'package:theraman/src/features/authentication/data/repo/auth_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

class SigninNotifier extends AutoDisposeAsyncNotifier<SigninState> {
  @override
  FutureOr<SigninState> build() {
    state = const AsyncData(SigninInitial());
    return future;
  }

  Future<void> signin({
    required String mobileNo,
    required String password,
    required String userType,
  }) async {
    state = const AsyncLoading();
    final result = await ref.watch(authRepoProvider).signin(
        mobileNo: mobileNo,
        password: password,
        userType: userType,
        cancelToken: ref.cancelToken());

    result.when(
      (success) {
        ref.read(userProvider.notifier).saveUser(
            userModel: success.copyWith(userType: userType, isLogin: true));
        state = const AsyncData(SigninLoaded());
      },
      (error) {
        state = AsyncError(
            error.errorMessage ?? "Invalid user name and password !",
            StackTrace.current);
      },
    );
  }
}
