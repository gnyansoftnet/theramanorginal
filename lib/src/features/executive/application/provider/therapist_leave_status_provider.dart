import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/data/repo/executive_repo_pod.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';

class Date {
  final String? from;
  final String? to;
  Date({this.from, this.to});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Date && other.from == from && other.to == to;
  }

  @override
  int get hashCode => from.hashCode ^ to.hashCode;
}

final therapistLeaveStatusProvider = FutureProvider.autoDispose
    .family<LeaveDetailsModel, Date>((ref, date) async {
  if (kDebugMode) {
    print("from date ${date.from}");
    print("to date ${date.to}");
  }
  final result = await ref
      .watch(executiveRepoProvider)
      .getAllTherapistLeaveDetail(fromDate: date.from, toDate: date.to);
  return result.when((success) {
    return success;
  }, (error) {
    throw error;
  });
});
