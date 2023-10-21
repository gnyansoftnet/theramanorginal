import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';

final therapistLeaveStatusProvider =
    FutureProvider.autoDispose<LeaveDetailsModel>((ref) async {
  final result = await ref
      .watch(executiveRepoProvider)
      .getAllTherapistLeaveDetail(fromDate: "10/10/2023", toDate: "10/10/2023");
  return result.when((success) {
    return success;
  }, (error) {
    throw error;
  });
});
