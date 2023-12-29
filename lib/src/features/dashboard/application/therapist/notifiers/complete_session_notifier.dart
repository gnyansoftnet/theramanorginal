import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class CompleteSessionNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr build() {
    state = const AsyncData(null);
    return future;
  }

  Future<void> completeSession({
    required int slotId,
  }) async {
    state = const AsyncLoading();
    String userType = await Preferences.getPreference("userType", "");
    final userId = await Preferences.getPreference("staffCode", "");
    Future.delayed(const Duration(seconds: 3));
    final result = await ref.watch(dashboardRepoProvider).completeSession(
          userId: userId,
          slotId: slotId,
          userType: userType,
          cancelToken: ref.cancelToken(),
        );

    result.when(
      (success) {
        state = const AsyncData(null);
      },
      (error) {
        state = AsyncError(error, StackTrace.current);
      },
    );
  }
}
