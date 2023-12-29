import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:theraman/src/core/routes/app_routes.gr.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

Future<DateTime> showDateTimeRangePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) async {
  DateTime? picked = await showDatePicker(
      useRootNavigator: false,
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate);
  return picked!;
}

Future<void> userLogout({required BuildContext context}) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure want to logout "),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No")),
            TextButton(
                onPressed: () async {
                  if (await Preferences.removeUser()) {
                    if (context.mounted) {
                      context.router.replaceAll([const SplashRoute()]);
                    }
                  }
                },
                child: const Text("Yes"))
          ],
        );
      });
}
