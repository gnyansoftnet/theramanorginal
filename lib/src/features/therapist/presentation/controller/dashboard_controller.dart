import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/application/providers/dashboard_provider.dart';
import 'package:theraman/src/features/therapist/application/providers/ongoing_provider.dart';

class DashboardController {
  Future<void> session({
    required BuildContext context,
    required WidgetRef ref,
    required int rsSlotId,
    required String status,
  }) async {
    if (status == "Started") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text("Complete"),
              content: const Text("Are you want to complete ?"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const Text("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(completeSessionProvider.notifier)
                          .completeSession(slotId: rsSlotId);
                      ref.invalidate(onGoingProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const Text("Yes")),
              ],
            );
          });
    } else if (status == "Yet To Start") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text("Start"),
              content: const Text("Are you want to start ?"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const Text("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(startSessionProvider.notifier)
                          .startSession(slotId: rsSlotId);
                      ref.invalidate(onGoingProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const Text("Yes")),
              ],
            );
          });
    }
  }
}
