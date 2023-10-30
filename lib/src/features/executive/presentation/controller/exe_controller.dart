import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/provider/exe_apply_leave_provider.dart';

class ExeController {
  void exeApplyLeave({
    required WidgetRef ref,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    required String noOfDays,
  }) {
    ref.read(exeApplyLeaveProvider.notifier).exeApplyLeave(
          noOfdays: double.parse(noOfDays),
          fromDate: fromDate,
          toDate: toDate,
          leaveType: leaveType,
          reason: reason,
        );
  }
}
