import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/executive/application/states/session_reschedule_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';

class SessionRescheduleNotifier
    extends AutoDisposeAsyncNotifier<SessionRescheduleState> {
  @override
  FutureOr<SessionRescheduleState> build() {
    state = const AsyncData(SessionRescheduleInitial());
    return future;
  }

  Future<void> sessionReschedule(
      {required int slotId,
      required String therapistName,
      required String slotTime,
      required String reason}) async {
    state = const AsyncLoading();
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));
    final result = await ref.watch(executiveRepoProvider).sessionReschedule(
        userType: userType ?? "",
        userId: userId ?? "",
        slotId: slotId,
        reason: reason,
        therapistName: therapistName,
        slotTime: slotTime,
        cancelToken: CancelToken());
    result.when((success) {
      state = const AsyncData(SessionRescheduleLoaded());
    }, (error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}
