import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/user/application/providers/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UserController {
  Future<void> redirectLink(
      {required String value, required String action}) async {
    final Uri launchUri = Uri(
      // scheme: 'tel',
      scheme: action,
      path: value,
    );
    await launchUrl(launchUri);
  }

  void applyLeave({
    required WidgetRef ref,
    required String fromDate,
    required String toDate,
    required String leaveType,
    required String reason,
    required String noOfDays,
  }) {
    print(fromDate);
    print(toDate);
    print(leaveType);
    print(reason);

    ref.read(applyLeaveProvider.notifier).userApplyLeave(
          noOfdays: double.parse(noOfDays),
          fromDate: fromDate,
          toDate: toDate,
          leaveType: leaveType,
          reason: reason,
        );
  }
}
