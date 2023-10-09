import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/providers/dashboard_provider.dart';

class DashboardController {
  Future<void> session({
    required BuildContext context,
    required WidgetRef ref,
    required String rsSlotId,
    required String status,
  }) async {
    if (status == "Started") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const AutoSizeText("Complete"),
              content: const AutoSizeText("Are you want to complete ?"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(completeSessionProvider.notifier)
                          .completeSession(rsSlotId);
                      ref.invalidate(dashboardProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("Yes")),
              ],
            );
          });
    } else if (status == "Yet To Start") {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const AutoSizeText("Start"),
              content: const AutoSizeText("Are you want to start ?"),
              actions: [
                TextButton(
                    onPressed: () async {
                      Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("No")),
                TextButton(
                    onPressed: () async {
                      await ref
                          .read(startSessionProvider.notifier)
                          .startSession(rsSlotId);
                      ref.invalidate(dashboardProvider);
                      if (context.mounted) Navigator.pop(ctx);
                    },
                    child: const AutoSizeText("Yes")),
              ],
            );
          });
    }
  }
}
