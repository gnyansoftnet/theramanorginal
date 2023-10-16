import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/features/dashboard/model/executive/completed_slot_all_therapist.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';

final completedSlotAllTherapistProvider =
    FutureProvider.autoDispose<CompletedSlotAllTherapistModel>((ref) async {
  final token = ref.cancelToken();
  final currentDate = DateTime.now();
  final date = DateFormat("MM/dd/yyy").format(currentDate);
  final result = await ref
      .watch(executivedashboardRepoProvider)
      .getCompletedSlotAllTherapist(date: date, cancelToken: token);
  return result.when((success) {
    return success;
  }, (error) {
    throw error;
  });
});
