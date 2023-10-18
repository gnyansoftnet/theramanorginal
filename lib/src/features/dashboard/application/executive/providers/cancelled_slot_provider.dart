import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';

final reasonProvider =
    FutureProvider.autoDispose<AllotedSlotResponseModel>((ref) async {
  final token = CancelToken();
  final currentDate = DateTime.now();
  final date = DateFormat('MM/dd/yyyy').format(currentDate);
  final result = await ref
      .watch(executivedashboardRepoProvider)
      .getCancelledSessionAllTherapist(date: date, cancelToken: token);
  return result.when((success) {
    ref.cacheFor();
    return success;
  }, (error) {
    throw error;
  });
});
