import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';
import '../../data/repo/dashboard_repo_pod.dart';

class StartSessionNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr build() {
    state = const AsyncData(null);
    return future;
  }

  Future<void> startSession(String userId) async {
    state = const AsyncLoading();
    String userType = await Preferences.getPreference("userType", "");

    Future.delayed(const Duration(seconds: 3));

    final result = await ref.watch(dashboardRepoProvider).startSession(
          userId: userId,
          userType: userType,
          // cancelToken: ref.cancelToken(),
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
