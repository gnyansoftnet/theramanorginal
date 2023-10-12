import 'package:flutter/material.dart';

Future<DateTime> showDateTimeRangePicker({
  required BuildContext context,
}) async {
  DateTime? picked = await showDatePicker(
      useRootNavigator: false,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1600),
      lastDate: DateTime(5000));
  return picked ?? DateTime.now();
}
