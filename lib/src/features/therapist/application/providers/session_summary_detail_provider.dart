import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/features/therapist/model/session_summary_detail_model.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final sessionSummaryDetailProvider =
    FutureProvider.autoDispose.family<SessionSummaryDetailModel, String>(
  (ref, month) async {
    final token = ref.cancelToken();
    String userId = await Preferences.getPreference("staffCode", "");
    if (kDebugMode) {
      print("Staff code $userId");
      print("Date $month");
    }

    final result = await ref
        .watch(therapistRepoProvider)
        .getSessionSummaryDetails(
            userId: userId,
            month: month == "Current Month" ? "CM" : "LM",
            cancelToken: token);
    return result.when((success) {
      // ref.cacheFor();
      return success;
    }, (error) {
      throw error;
    });
  },
);
