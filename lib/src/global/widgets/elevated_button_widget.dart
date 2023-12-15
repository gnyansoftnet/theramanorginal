import 'package:flutter/material.dart';
import 'package:theraman/src/utils/constants/app_colors.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final bool? isChild;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  const ElevatedButtonWidget(
      {super.key,
      this.text,
      this.isChild = false,
      this.child,
      required this.onPressed,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(double.infinity, 50)),
        onPressed: onPressed,
        child: isChild!
            ? child
            : Text(
                text!,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppColors.white, fontWeight: FontWeight.bold),
              ));
  }
}
