import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';

final tomorrowSessionProvider =
    FutureProvider.autoDispose.family<AllotedSlotResponseModel, String>(
  (ref, date) async {
    final token = ref.cancelToken();
    final userId = ref.watch(userProvider.select((value) => value?.Staff_Code));
    final result = await ref.watch(dashboardRepoProvider).getAllotedSlotDetails(
        userId: userId ?? "", date: date, cancelToken: token);
    return result.when((success) {
      ref.cacheFor();
      return success;
    }, (error) {
      throw error;
    });
  },
);
