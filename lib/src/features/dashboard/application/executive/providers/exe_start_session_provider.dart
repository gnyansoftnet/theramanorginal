import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/exe_start_session_notifier.dart';

final exeStartSessionProvider =
    AutoDisposeAsyncNotifierProvider<ExeSessionStartNotifier, void>(
        () => ExeSessionStartNotifier());
