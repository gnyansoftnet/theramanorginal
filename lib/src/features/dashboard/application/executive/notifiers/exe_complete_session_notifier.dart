import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

class ExeCompleteSessionNotifier extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {
    state = const AsyncData(null);
    return future;
  }

  Future<void> exeCompleteSession({
    required int slotId,
  }) async {
    state = const AsyncLoading();
    final userType = await Preferences.getPreference("userType", "");
    final userId = await Preferences.getPreference("staffCode", "");
    Future.delayed(const Duration(seconds: 3));

    final result = await ref
        .watch(executivedashboardRepoProvider)
        .exeCompleteSession(userType: userType, userId: userId, slotId: slotId);
    result.when((success) {
      state = const AsyncData(null);
    }, (error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}
