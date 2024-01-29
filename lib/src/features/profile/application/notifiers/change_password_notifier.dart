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

  Future<void> changePassword({
    required String currPass,
    required String newPass,
  }) async {
    state = const AsyncLoading();
    final staffCode =
        ref.watch(userProvider.select((data) => data?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));

    final result = await ref.watch(profielRepoPod).changePassword(
        userType: userType ?? "",
        staffCode: staffCode ?? "",
        currPass: currPass,
        newPass: newPass);

    result.when((success) {
      state = AsyncData(ChangePasswordLoaded(msg: success));
    }, (error) {
      state = AsyncError(
          error.errorMessage ?? "Can not changed password", StackTrace.current);
    });
  }
}
