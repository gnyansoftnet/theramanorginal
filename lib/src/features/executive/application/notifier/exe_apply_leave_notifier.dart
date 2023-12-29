import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/states/exe_apply_leave_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

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
    String userId = await Preferences.getPreference("staffCode", "");
    String userType = await Preferences.getPreference("userType", "");
    state = const AsyncLoading();
    final result = await ref.watch(executiveRepoProvider).exeApplyLeave(
        userType: userType,
        userId: userId,
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
