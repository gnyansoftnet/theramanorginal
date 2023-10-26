import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/application/therapist/notifiers/complete_session_notifier.dart';
import 'package:theraman/src/features/dashboard/application/therapist/notifiers/start_session_notifier.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final completedSessionProvider =
    FutureProvider.autoDispose<AllotedSlotResponseModel>(
  (ref) async {
    final token = ref.cancelToken();

    String staffCode = await Preferences.getPreference("staffCode", "");
    final date = DateFormat("MM/dd/yyy").format(DateTime.now());
    if (kDebugMode) {
      print("Staff code $staffCode");
      print("Date $date");
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
