import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/application/providers/apply_leave_provider.dart';

class UserController {
  void applyLeave({
    required WidgetRef ref,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    required String noOfDays,
  }) {
    ref.read(applyLeaveProvider.notifier).userApplyLeave(
          noOfdays: double.parse(noOfDays),
          fromDate: fromDate,
          toDate: toDate,
          leaveType: leaveType,
          reason: reason,
        );
  }
}
