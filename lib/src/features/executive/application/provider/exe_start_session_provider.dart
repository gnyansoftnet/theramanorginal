import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/exe_start_session_notifier.dart';

final exeStartSessionProvider =
    AutoDisposeAsyncNotifierProvider<ExeSessionStartNotifier, void>(
        () => ExeSessionStartNotifier());
