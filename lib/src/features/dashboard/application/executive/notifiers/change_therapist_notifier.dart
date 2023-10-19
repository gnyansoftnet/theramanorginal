import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/change_therapist_state.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class ChangeTherapistNotifier
    extends AutoDisposeAsyncNotifier<ChangeTherapistState> {
  @override
  FutureOr<ChangeTherapistState> build() {
    state = const AsyncData(ChangeTherapistInitial());
    return future;
  }

  Future<void> changeTherapist(
      {required int slotId,
      required String therapistName,
      required String reason}) async {
    state = const AsyncLoading();
    final userId = await Preferences.getPreference("staffCode", "");
    final userType = await Preferences.getPreference("userType", "");
    final result = await ref
        .watch(executivedashboardRepoProvider)
        .changeTherapist(
            userType: userType,
            userId: userId,
            slotId: slotId,
            reason: reason,
            therapistName: therapistName,
            cancelToken: CancelToken());
    result.when((success) {
      state = const AsyncData(ChangeTherapistLoaded());
    }, (error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}
