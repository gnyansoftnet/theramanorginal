import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/tomorrow_session/data/executive/repo/exe_tomorrow_session_repo_pod.dart';
import 'package:theraman/src/global/model/tomorrow_session_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';

final exeTomorrowSessionProvider =
    FutureProvider.autoDispose<TomorrowSessionModel>((ref) async {
  // ref.autoRefresh(duration: const Duration(seconds: 5));
  final token = CancelToken();

  final currentDate = DateTime.now();
  DateTime yesterday = currentDate.add(const Duration(days: 1));
  final date = DateFormat('MM/dd/yyyy').format(yesterday);
  if (kDebugMode) {
    print("Date $date");
  }
  final result = await ref
      .watch(exeTomorrowSessionRepoProvider)
      .getTomorrowSession(date: date, cancelToken: token);
  return result.when((success) {
    ref.cacheFor();
    return success;
  }, (error) {
    throw error;
  });
});
