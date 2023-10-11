import 'package:flutter/material.dart';

Future<DateTime> showDateTimeRangePicker(
    {required BuildContext context,
    required DateTime firstDate,
    required DateTime lastDate}) async {
  DateTime? picked = await showDatePicker(
      useRootNavigator: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate);
  return picked ?? DateTime.now();
}
