import 'package:flutter/widgets.dart';

extension FocusNodeExtension on BuildContext {
  void changeFocus(FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(this).requestFocus(nextFocus);
  }
}
