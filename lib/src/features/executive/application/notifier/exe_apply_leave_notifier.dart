import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/executive/application/states/exe_apply_leave_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

class ExeApplyleaveNotifier
    extends AutoDisposeAsyncNotifier<ExeApplyLeaveState> {
  @override
  FutureOr<ExeApplyLeaveState> build() {
    state = const AsyncData(ExeApplyLeaveInitial());
    return future;
  }

  Future<void> exeApplyLeave({
    required fromDate,
    required noOfdays,
    required toDate,
    required leaveType,
    required reason,
  }) async {
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));
    state = const AsyncLoading();
    final result = await ref.watch(executiveRepoProvider).exeApplyLeave(
        userType: userType ?? "",
        userId: userId ?? "",
        noOfDays: noOfdays,
        fromDate: fromDate,
        toDate: toDate,
        leaveType: leaveType,
        reason: reason,
        cancelToken: ref.cancelToken());

    result.when(
      (sucess) {
        state = const AsyncData(ExeApplyLeaveLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
