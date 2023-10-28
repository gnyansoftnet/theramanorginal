import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/exe_complete_session_notifier.dart';

final exeCompleteSessionProvider =
    AutoDisposeAsyncNotifierProvider<ExeCompleteSessionNotifier, void>(
        () => ExeCompleteSessionNotifier());
