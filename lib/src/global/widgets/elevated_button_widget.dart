import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double borderRadus;
  const ElevatedButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textStyle,
      required this.borderRadus});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadus)),
            padding: const EdgeInsets.symmetric(vertical: 20)),
        onPressed: onPressed,
        child: AutoSizeText(
          text,
          style: textStyle,
        ));
  }
}
