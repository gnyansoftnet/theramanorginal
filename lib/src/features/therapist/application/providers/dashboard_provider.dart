import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/application/notifiers/complete_session_notifier.dart';
import 'package:theraman/src/features/therapist/application/notifiers/start_session_notifier.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

final completedSessionProvider =
    FutureProvider.autoDispose<AllotedSlotResponseModel>(
  (ref) async {
    final token = ref.cancelToken();

    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));

    final date = DateFormat("MM/dd/yyy").format(DateTime.now());

    final result = await ref.watch(therapistRepoProvider).getCompletedSession(
        userId: userId ?? "", date: date, cancelToken: token);

    return result.when(
      (sucess) {
        ref.cacheFor();
        return sucess;
      },
      (error) {
        throw error;
      },
    );
  },
  name: "completedSessionProvider",
);

final startSessionProvider =
    AutoDisposeAsyncNotifierProvider<StartSessionNotifier, void>(
  () => StartSessionNotifier(),
  name: "startSessionProvider",
);

final completeSessionProvider =
    AutoDisposeAsyncNotifierProvider<CompleteSessionNotifier, void>(
  () => CompleteSessionNotifier(),
  name: "completeSessionProvider",
);
