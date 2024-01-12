import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';

class ExeSessionStartNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr build() {
    state = const AsyncData(null);
    return future;
  }

  Future<void> exeStartSession({
    required int slotId,
  }) async {
    state = const AsyncLoading();
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final userType = ref.watch(userProvider.select((value) => value?.userType));
    Future.delayed(const Duration(seconds: 3));

    final result = await ref
        .watch(executivedashboardRepoProvider)
        .exeStartSession(
            userType: userType ?? "", userId: userId ?? "", slotId: slotId);
    result.when((success) {
      state = const AsyncData(null);
    }, (error) {
      state = AsyncError(error, StackTrace.current);
    });
  }
}
