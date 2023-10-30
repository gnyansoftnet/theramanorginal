import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/dashboard/application/executive/notifiers/resume_cancelled_session_notifier.dart';

final resumeCancelledSessionProvider =
    AutoDisposeAsyncNotifierProvider<ResumeCancelledSessionNotifier, void>(
        () => ResumeCancelledSessionNotifier());
