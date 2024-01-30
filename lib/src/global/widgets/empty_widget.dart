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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(AppAssets.emptyImg)),
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  elevation: 4.0, fixedSize: const Size(100, 40)),
              child: const Text("REFRESH"))
        ],
      ),
    );
  }
}
