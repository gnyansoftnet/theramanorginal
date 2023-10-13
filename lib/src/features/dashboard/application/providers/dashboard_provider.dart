import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/application/notifiers/complete_session_notifier.dart';
import 'package:theraman/src/features/dashboard/application/notifiers/start_session_notifier.dart';
import 'package:theraman/src/features/dashboard/data/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/features/dashboard/model/alloted_slot_response.dart';
import 'package:theraman/src/features/dashboard/model/completed_session_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final onGoingProvider = FutureProvider.autoDispose<AllotedSlotResponse>(
  (ref) async {
    final token = ref.cancelToken();
    String staffCode = await Preferences.getPreference("staffCode", "");
    final currentDate = DateTime.now();
    final date = DateFormat('MM/dd/yyyy').format(currentDate);
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref.watch(dashboardRepoProvider).getAllotedSlotDetails(
        userId: staffCode, date: date, cancelToken: token);

    return result.when(
      (sucess) {
        ref.cacheFor();
        return sucess;
      },
      (error) {
        throw error;
      },
    );
  },
  name: "onGoingProvider",
);

final completedSessionProvider =
    FutureProvider.autoDispose<CompletedSessionModel>(
  (ref) async {
    final token = ref.cancelToken();

    String staffCode = await Preferences.getPreference("staffCode", "");
    final currentDate = DateTime.now();
    final date = DateFormat('MM/dd/yyyy').format(currentDate);
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref
        .watch(dashboardRepoProvider)
        .getCompletedSession(userId: staffCode, date: date, cancelToken: token);

    return result.when(
      (sucess) {
        ref.cacheFor();
        return sucess;
      },
      (error) {
        throw error;
      },
    );
  },
  name: "completedSessionProvider",
);

final startSessionProvider =
    AutoDisposeAsyncNotifierProvider<StartSessionNotifier, void>(
  () => StartSessionNotifier(),
  name: "startSessionProvider",
);

final completeSessionProvider =
    AutoDisposeAsyncNotifierProvider<CompleteSessionNotifier, void>(
  () => CompleteSessionNotifier(),
  name: "completeSessionProvider",
);
