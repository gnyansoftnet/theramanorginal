import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/cancel_session_state.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class CancelSessionNotifier
    extends AutoDisposeAsyncNotifier<CancelSessionState> {
  @override
  FutureOr<CancelSessionState> build() {
    state = const AsyncData(CancelSessionInitial());
    return future;
  }

  Future<void> cancelSession(
      {required int slotId,
      required String isAdjustable,
      required String reason}) async {
    state = const AsyncLoading();
    final userId = await Preferences.getPreference("staffCode", "");
    final userType = await Preferences.getPreference("userType", "");
    final result = await ref
        .watch(executivedashboardRepoProvider)
        .cancelSession(
            userId: userId,
            userType: userType,
            slotId: slotId,
            isAdjustable: isAdjustable,
            reason: reason,
            cancelToken: CancelToken());
    result.when((success) {
      state = const AsyncData(CancelSessionLoaded());
    }, (error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}
