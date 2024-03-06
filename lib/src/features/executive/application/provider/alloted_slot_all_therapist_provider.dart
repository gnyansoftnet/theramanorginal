import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

final allotedSlotAllTherapistProvider =
    FutureProvider.autoDispose<AllotedSlotResponseModel>((ref) async {
  final token = ref.cancelToken();
  final date = DateFormat("MM/dd/yyy").format(DateTime.now());
  // ref.autoRefresh(duration: const Duration(seconds: 5));
  final result = await ref
      .watch(executiveRepoProvider)
      .getAllotedSlotAllTherapist(date: date, cancelToken: token);
  return result.when((success) {
    return success;
  }, (error) {
    throw error;
  });
});
