import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancel_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/change_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/session_reschedule_provider.dart';

class EDashboardController {
  void cancelSession(
      {required WidgetRef ref,
      required int slotId,
      required String reason,
      required String isAdjustable}) async {
    ref.read(cancelSessionProvider.notifier).cancelSession(
        slotId: slotId, isAdjustable: isAdjustable, reason: reason);
  }

  void changeTherapist(
      {required WidgetRef ref,
      required int slotId,
      required String reason,
      required String therapistName}) async {
    ref.read(changeTherapistProvider.notifier).changeTherapist(
        slotId: slotId, therapistName: therapistName, reason: reason);
  }

  void sessionRescdule(
      {required WidgetRef ref,
      required int slotId,
      required String reason,
      required String slotTime,
      required String therapistName}) async {
    ref.read(sessionRescheduleProvider.notifier).sessionReschedule(
        slotId: slotId,
        therapistName: therapistName,
        slotTime: slotTime,
        reason: reason);
  }
}
