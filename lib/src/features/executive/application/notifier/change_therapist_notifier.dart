import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/executive/application/states/change_therapist_state.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';

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
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));
    final result = await ref.watch(executiveRepoProvider).changeTherapist(
        userType: userType ?? "",
        userId: userId ?? "",
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
