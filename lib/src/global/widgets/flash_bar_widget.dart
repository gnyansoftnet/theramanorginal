import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class FlashBarWidget extends StatelessWidget {
  final FlashController controller;
  final String content;
  const FlashBarWidget(
      {super.key, required this.controller, required this.content});

  @override
  Widget build(BuildContext context) {
    return FlashBar(
      controller: controller,
      content: Text(content),
      icon: const Icon(
        Icons.tips_and_updates,
        color: Colors.orange,
      ),
      elevation: 5.0,
      useSafeArea: true,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      indicatorColor: Colors.orange,
      title: const Text(
        "Warning !",
        style: TextStyle(letterSpacing: 1),
      ),
      actions: [
        TextButton(
            onPressed: () => controller.dismiss(true), child: const Text('OK'))
      ],
    );
  }
}
