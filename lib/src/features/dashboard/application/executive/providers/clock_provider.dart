import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/clock_notifier.dart';

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
