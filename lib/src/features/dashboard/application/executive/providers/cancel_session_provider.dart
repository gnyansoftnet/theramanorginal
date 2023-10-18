import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/cancel_session_notifier.dart';
import 'package:theraman/src/features/dashboard/application/executive/states/cancel_session_state.dart';

final cancelSessionProvider =
    AutoDisposeAsyncNotifierProvider<CancelSessionNotifier, CancelSessionState>(
  () => CancelSessionNotifier(),
  name: "cancelSessionProvider",
);
