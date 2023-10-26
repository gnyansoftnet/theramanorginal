import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/therapist/application/notifiers/apply_leave_notifier.dart';
import 'package:theraman/src/features/therapist/application/states/apply_leave_state.dart';

final applyLeaveProvider =
    AutoDisposeAsyncNotifierProvider<ApplyleaveNotifier, ApplyLeaveState>(
  () => ApplyleaveNotifier(),
  name: "applyLeaveProvider",
);
