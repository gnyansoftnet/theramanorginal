import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerNotiFier extends StateNotifier<int> {
  TimerNotiFier() : super(0) {
    if (state != 30) {
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        state++;
      });
    }
  }

  late final Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
