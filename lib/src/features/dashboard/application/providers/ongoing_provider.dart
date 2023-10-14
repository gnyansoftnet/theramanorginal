import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/dashboard/data/repo/dashboard_repo_pod.dart';
import 'package:theraman/src/features/dashboard/model/alloted_slot_response.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final onGoingProvider = StreamProvider.autoDispose<AllotedSlotResponse>(
  (ref) async* {
    final token = ref.cancelToken();
    String staffCode = await Preferences.getPreference("staffCode", "");
    final currentDate = DateTime.now();
    final date = DateFormat('MM/dd/yyyy').format(currentDate);
    if (kDebugMode) {
      print("Staff code $staffCode");
      print("Date $date");
    }

    while (await Future.delayed(const Duration(seconds: 3), () => true)) {
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
    }
  },
  name: "onGoingProvider",
);
