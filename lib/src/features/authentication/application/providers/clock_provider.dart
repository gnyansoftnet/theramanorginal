import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/notifiers/clock_notifier.dart';

final timerProvider =
    StateNotifierProvider.autoDispose<ClockNotifier, int>((ref) {
  return ClockNotifier();
});
