import 'package:flutter/material.dart';
import '../../utils/constants/constant.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String? text;
  final Widget? child;
  final bool fullWidth;
  final VoidCallback? onPressed;
  const ElevatedButtonWidget({
    super.key,
    this.text,
    this.fullWidth = true,
    this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 4.0,
            minimumSize: const Size(double.infinity, 48)),
        onPressed: onPressed,
        child: child ??
            Text(
              text!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                  letterSpacing: 1.5),
            ));
  }
}
