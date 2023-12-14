import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  const ElevatedButtonWidget(
      {super.key, required this.child, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(double.infinity, 50)),
        onPressed: onPressed,
        child: child);
  }
}
