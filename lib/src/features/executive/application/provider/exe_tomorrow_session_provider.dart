import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';

final exeTomorrowSessionProvider = FutureProvider.autoDispose
    .family<AllotedSlotResponseModel, String>((ref, date) async {
  // ref.autoRefresh(duration: const Duration(seconds: 5));
  final token = CancelToken();

  if (kDebugMode) {
    print("Date $date");
  }
  final result = await ref
      .watch(executiveRepoProvider)
      .getTomorrowSession(date: date, cancelToken: token);
  return result.when((success) {
    ref.cacheFor();
    return success;
  }, (error) {
    throw error;
  });
});
