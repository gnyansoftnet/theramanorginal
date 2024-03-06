import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

final onGoingProvider = FutureProvider.autoDispose<AllotedSlotResponseModel>(
  (ref) async {
    final token = ref.cancelToken();
    // ref.autoRefresh(duration: const Duration(seconds: 5));
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final date = DateFormat("MM/dd/yyy").format(DateTime.now());
    final result = await ref.watch(therapistRepoProvider).getAllotedSlotDetails(
        userId: userId ?? "", date: date, cancelToken: token);
    return result.when((success) {
      ref.cacheFor();
      return success;
    }, (error) {
      throw error;
    });
  },
);
