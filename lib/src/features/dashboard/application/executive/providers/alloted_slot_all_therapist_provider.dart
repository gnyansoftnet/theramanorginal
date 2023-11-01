import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';

final allotedSlotAllTherapistProvider =
    FutureProvider.autoDispose<AllotedSlotResponseModel>((ref) async {
  final token = ref.cancelToken();
  final date = DateFormat("MM/dd/yyy").format(DateTime.now());
  // ref.autoRefresh(duration: const Duration(seconds: 5));
  final result = await ref
      .watch(executivedashboardRepoProvider)
      .getAllotedSlotAllTherapist(date: date, cancelToken: token);
  return result.when((success) {
    return success;
  }, (error) {
    throw error;
  });
});
