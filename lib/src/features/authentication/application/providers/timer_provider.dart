import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/timer_notifier.dart';

final timerProvider = StateNotifierProvider<TimerNotiFier, int>((ref) {
  return TimerNotiFier();
});
