import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/application/providers/user_provider.dart';
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
    ref.read(applyLeaveProvider.notifier).userApplyLeave(
          noOfdays: double.parse(noOfDays),
          fromDate: fromDate,
          toDate: toDate,
          leaveType: leaveType,
          reason: reason,
        );
  }
}
