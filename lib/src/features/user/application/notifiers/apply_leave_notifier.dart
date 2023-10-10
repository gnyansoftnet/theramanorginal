import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/user/application/states/apply_leave_state.dart';
import 'package:theraman/src/features/user/data/repo/user_repo_pod.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class ApplyleaveNotifier extends AutoDisposeAsyncNotifier<ApplyLeaveState> {
  @override
  FutureOr<ApplyLeaveState> build() {
    state = const AsyncData(ApplyLeaveInitial());
    return future;
  }

  Future<void> userApplyLeave({
    required fromDate,
    required noofdays,
    required toDate,
    required leaveType,
    required reason,
  }) async {
    String userId = await Preferences.getPreference("staffCode", "");
    state = const AsyncLoading();
    final result = await ref.watch(userRepoProvider).userApplyLeave(
        userId: userId,
        noOfDays: noofdays,
        fromDate: fromDate,
        toDate: toDate,
        leaveType: leaveType,
        reason: reason,
        cancelToken: ref.cancelToken());

    result.when(
      (sucess) {
        state = const AsyncData(ApplyLeaveLoaded());
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
