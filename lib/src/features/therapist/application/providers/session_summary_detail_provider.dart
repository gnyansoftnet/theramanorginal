import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/features/therapist/model/session_summary_detail_model.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

final sessionSummaryDetailProvider =
    FutureProvider.autoDispose.family<SessionSummaryDetailModel, String>(
  (ref, month) async {
    final token = ref.cancelToken();
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final result = await ref
        .watch(therapistRepoProvider)
        .getSessionSummaryDetails(
            userId: userId ?? "",
            month: month == "Current Month" ? "CM" : "LM",
            cancelToken: token);
    return result.when((success) {
      return success;
    }, (error) {
      throw error;
    });
  },
);
