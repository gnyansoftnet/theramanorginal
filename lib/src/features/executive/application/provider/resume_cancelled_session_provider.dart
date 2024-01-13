import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/executive/application/notifier/resume_cancelled_session_notifier.dart';

final resumeCancelledSessionProvider =
    AutoDisposeAsyncNotifierProvider<ResumeCancelledSessionNotifier, void>(
        () => ResumeCancelledSessionNotifier());
