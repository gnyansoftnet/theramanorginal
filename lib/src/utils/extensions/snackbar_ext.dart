import 'package:flutter/material.dart';

extension AppSnackBar on BuildContext {
  ScaffoldMessengerState get _scafoldMessenger => ScaffoldMessenger.of(this);

  /// show snakbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          Widget content) =>
      _scafoldMessenger.showSnackBar(SnackBar(
        content: content,
        duration: const Duration(seconds: 5),
        dismissDirection: DismissDirection.horizontal,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));

  /// hide current snakbar
  void hideSnackBar() => _scafoldMessenger.hideCurrentSnackBar();

  /// clear all current snakbars
  void clearSnackBar() => _scafoldMessenger.clearSnackBars();
}
