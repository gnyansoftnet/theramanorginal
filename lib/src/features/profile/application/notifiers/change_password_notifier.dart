import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/profile/application/states/change_password_state.dart';
import 'package:theraman/src/features/profile/data/repo/profile_repo_pod.dart';

class ChangePasswordNotifier
    extends AutoDisposeAsyncNotifier<ChangePasswordState> {
  @override
  FutureOr<ChangePasswordState> build() {
    state = const AsyncData(ChangePasswordInitial());
    return future;
  }

  Future<void> changePassword(
      {required String currPass, required String newPass}) async {
    state = const AsyncLoading();
    final exeCode = ref.watch(userProvider.select((data) => data?.Staff_Code));
    final result = await ref.watch(profielRepoPod).changePassword(
        exeCode: exeCode ?? "", currPass: currPass, newPass: newPass);

    result.when((success) {
      state = AsyncData(ChangePasswordLoaded(msg: success));
    }, (error) {
      state = AsyncError(error.errorMessage ?? "", StackTrace.current);
    });
  }
}
