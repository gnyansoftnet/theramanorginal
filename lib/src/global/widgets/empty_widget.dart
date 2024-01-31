import 'package:flutter/material.dart';
import 'package:theraman/src/utils/constants/constant.dart';

class EmptyWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const EmptyWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage(AppAssets.emptyImg),
              height: size.height / 2,
            ),
            ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    elevation: 4.0, padding: const EdgeInsets.all(15)),
                child: Text(
                  "REFRESH",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).cardColor, letterSpacing: 1.5),
                ))
          ],
        ),
      ),
    );
  }
}
