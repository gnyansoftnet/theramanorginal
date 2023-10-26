import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/therapist/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/global/model/alloted_slot_response_model.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final onGoingProvider = FutureProvider.autoDispose<AllotedSlotResponseModel>(
  (ref) async {
    final token = ref.cancelToken();
    ref.autoRefresh(duration: const Duration(seconds: 5));
    String staffCode = await Preferences.getPreference("staffCode", "");
    final date = DateFormat("MM/dd/yyy").format(DateTime.now());
    if (kDebugMode) {
      print("Staff code $staffCode");
      print("Date $date");
    }
    final result = await ref.watch(dashboardRepoProvider).getAllotedSlotDetails(
        userId: staffCode, date: date, cancelToken: token);
    return result.when((success) {
      ref.cacheFor();
      return success;
    }, (error) {
      throw error;
    });
  },
  name: "onGoingProvider",
);
