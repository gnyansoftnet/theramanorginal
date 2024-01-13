import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/session_reschedule_notifier.dart';
import 'package:theraman/src/features/executive/application/states/session_reschedule_state.dart';

final sessionRescheduleProvider = AutoDisposeAsyncNotifierProvider<
    SessionRescheduleNotifier,
    SessionRescheduleState>(() => SessionRescheduleNotifier());
