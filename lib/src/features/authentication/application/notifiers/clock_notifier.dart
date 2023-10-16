import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockNotifier extends StateNotifier<int> {
  ClockNotifier() : super(30);

  void startTimer() async {
    for (var i = 0; i <= 30; i++) {
      state = 30 - i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
