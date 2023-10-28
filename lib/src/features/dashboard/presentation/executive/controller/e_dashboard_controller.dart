import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/cancel_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/change_therapist_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/exe_complete_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/exe_start_session_provider.dart';
import 'package:theraman/src/features/dashboard/application/executive/providers/session_reschedule_provider.dart';
import 'package:theraman/src/features/dashboard/application/therapist/providers/ongoing_provider.dart';
import 'package:theraman/src/utils/extensions/common_ext/alert_dialog_ext.dart';

class EDashboardController {
  void cancelSession(
      {required BuildContext context,
      required WidgetRef ref,
      required int slotId,
      required String reason,
      required String isAdjustable}) async {
    context.showCustomDialog(builder: (ctx) {
      return AlertDialog(
        title: const Text("Cancel"),
        content: const Text("Are you sure want to cancel ?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("No")),
          TextButton(
              onPressed: () {
                ref.read(cancelSessionProvider.notifier).cancelSession(
                    slotId: slotId, isAdjustable: isAdjustable, reason: reason);
              },
              child: const Text("Yes"))
        ],
      );
    });
  }

  void changeTherapist(
      {required BuildContext context,
      required WidgetRef ref,
      required int slotId,
      required String reason,
      required String therapistName}) async {
    context.showCustomDialog(builder: (ctx) {
      return AlertDialog(
        title: const Text("Change"),
        content: const Text("Are you sure want to change therapist ?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("No")),
          TextButton(
              onPressed: () {
                ref.read(changeTherapistProvider.notifier).changeTherapist(
                    slotId: slotId,
                    therapistName: therapistName,
                    reason: reason);
              },
              child: const Text("Yes"))
        ],
      );
    });
  }

  void sessionRescdule(
      {required BuildContext context,
      required WidgetRef ref,
      required int slotId,
      required String reason,
      required String slotTime,
      required String therapistName}) async {
    context.showCustomDialog(builder: (ctx) {
      return AlertDialog(
        title: const Text("Reshedule"),
        content: const Text("Are you sure want to reschedule session ?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text("No")),
          TextButton(
              onPressed: () {
                ref.read(sessionRescheduleProvider.notifier).sessionReschedule(
                    slotId: slotId,
                    therapistName: therapistName,
                    slotTime: slotTime,
                    reason: reason);
              },
              child: const Text("Yes"))
        ],
      );
    });
  }

  Future<void> exeStartSession(
      {required BuildContext context,
      required WidgetRef ref,
      required int slotId}) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("Start Session"),
            content: const Text("Are you sure want to start ? "),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(ctx);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () async {
                    await ref
                        .read(exeStartSessionProvider.notifier)
                        .exeStartSession(slotId: slotId);
                    if (context.mounted) Navigator.pop(ctx);
                  },
                  child: const Text("Yes"))
            ],
          );
        });
  }

  Future<void> exeCompleteSession(
      {required BuildContext context,
      required WidgetRef ref,
      required int slotId}) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("Complete Session"),
            content: const Text("Are you sure want to complete ? "),
            actions: [
              TextButton(
                  onPressed: () async {
                    Navigator.pop(ctx);
                  },
                  child: const Text("No")),
              TextButton(
                  onPressed: () async {
                    await ref
                        .read(exeCompleteSessionProvider.notifier)
                        .exeCompleteSession(slotId: slotId);
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text("Yes"))
            ],
          );
        });
  }
}
