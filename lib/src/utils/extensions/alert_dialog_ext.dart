import 'package:flutter/material.dart';

extension CustomDialogExtension on BuildContext {
  Future<S?> showCustomDialog<S>({
    required WidgetBuilder builder,
    String? routerName,
    bool barrierDismissible = true,
  }) {
    return showDialog<S>(
      context: this,
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(this).modalBarrierDismissLabel,
      routeSettings:
          routerName != null ? RouteSettings(name: routerName) : null,
      builder: (BuildContext buildContext) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(
            builder: (BuildContext context) {
              return pageChild;
            },
          ),
        );
      },
    );
  }
}
