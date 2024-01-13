import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/features/executive/model/reason_model.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';

final reasonProvider = FutureProvider.autoDispose<ReasonModel>((ref) async {
  final token = CancelToken();
  final result =
      await ref.watch(executiveRepoProvider).getReason(cancelToken: token);
  return result.when((success) {
    ref.cacheFor(const Duration(days: 1));
    return success;
  }, (error) {
    throw error;
  });
});
