import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/cancel_session_state.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';

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
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));
    final result = await ref
        .watch(executivedashboardRepoProvider)
        .cancelSession(
            userId: userId ?? "",
            userType: userType ?? "",
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
