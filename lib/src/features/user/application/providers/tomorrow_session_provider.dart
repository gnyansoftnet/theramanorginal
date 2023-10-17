import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final tomorrowSessionProvider =
    StreamProvider.autoDispose<AllotedSlotResponseModel>(
  (ref) async* {
    final token = ref.cancelToken();
    String staffCode = await Preferences.getPreference("staffCode", "");
    final currentDate = DateTime.now();
    DateTime yesterday = currentDate.add(const Duration(days: 1));
    final date = DateFormat('MM/dd/yyyy').format(yesterday);
    if (kDebugMode) {
      print("Staff code $staffCode");
      print("Date $date");
    }

    yield* ref
        .watch(dashboardRepoProvider)
        .getAllotedSlotDetails(
            userId: staffCode, date: date, cancelToken: token)
        .map((result) {
      return result.when(
        (success) {
          ref.cacheFor();
          return success;
        },
        (error) {
          throw error;
        },
      );
    });
  },
  name: "tomorrowSessionProvider",
);
