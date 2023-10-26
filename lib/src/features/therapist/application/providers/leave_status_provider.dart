import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/features/therapist/model/leave_details_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

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

final leaveStatusProvider =
    FutureProvider.autoDispose.family<LeaveDetailsModel, Date>(
  (ref, date) async {
    final token = ref.cancelToken();
    String staffCode = await Preferences.getPreference("staffCode", "");

    if (kDebugMode) {
      print("print staff code $staffCode");
      print("from date ${date.from}");
      print("to date ${date.to}");
    }
    final result = await ref.watch(therapistRepoProvider).getleaveStatus(
        userId: staffCode,
        fromDate: date.from,
        toDate: date.to,
        cancelToken: token);

    return result.when(
      (sucess) {
        ref.cacheFor();
        return sucess;
      },
      (error) {
        throw error;
      },
    );
  },
  name: "leaveStatusProvider",
);
