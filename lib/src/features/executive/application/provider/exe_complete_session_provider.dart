import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/exe_complete_session_notifier.dart';

final exeCompleteSessionProvider =
    AutoDisposeAsyncNotifierProvider<ExeCompleteSessionNotifier, void>(
        () => ExeCompleteSessionNotifier());
