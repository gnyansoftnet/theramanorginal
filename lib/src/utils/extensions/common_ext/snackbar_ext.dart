import 'package:flutter/material.dart';

extension AppSnackBar on BuildContext {
  ScaffoldMessengerState get _scafoldMessenger => ScaffoldMessenger.of(this);

  /// show snakbar
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackBar) =>
      _scafoldMessenger.showSnackBar(snackBar);

  /// hide current snakbar
  void hideSnackBar() => _scafoldMessenger.hideCurrentSnackBar();

  /// clear all current snakbars
  void clearSnackBar() => _scafoldMessenger.clearSnackBars();
}
