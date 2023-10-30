import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/exe_apply_leave_notifier.dart';
import 'package:theraman/src/features/executive/application/states/exe_apply_leave_state.dart';

final exeApplyLeaveProvider =
    AutoDisposeAsyncNotifierProvider<ExeApplyleaveNotifier, ExeApplyLeaveState>(
        () => ExeApplyleaveNotifier());
