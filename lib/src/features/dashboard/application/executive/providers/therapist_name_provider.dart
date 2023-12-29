import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/data/executive/repo/executive_dashboard_repo_pod.dart';
import 'package:theraman/src/features/dashboard/model/executive/therapist_name_model.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';

final therapistNameProvider =
    FutureProvider.autoDispose<TherapistNameModel>((ref) async {
  final token = CancelToken();
  final result = await ref
      .watch(executivedashboardRepoProvider)
      .getTherapistName(cancelToken: token);
  return result.when((success) {
    ref.cacheFor(const Duration(days: 1));
    return success;
  }, (error) {
    throw error;
  });
});
