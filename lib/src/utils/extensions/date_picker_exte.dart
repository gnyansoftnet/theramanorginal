import 'package:flutter/material.dart';

extension DateTimeExtension on DateTime {
  static Future<DateTime> showDate({
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
      lastDate: lastDate,
    );
    return picked!;
  }
}
