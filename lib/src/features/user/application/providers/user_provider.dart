import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/features/user/application/notifiers/apply_leave_notifier.dart';
import 'package:theraman/src/features/user/application/states/apply_leave_state.dart';
import 'package:theraman/src/features/user/data/repo/user_repo_pod.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import '../../../../utils/local_store/preferences.dart';
import '../../../dashboard/data/repo/dashboard_repo_pod.dart';
import '../../../dashboard/model/alloted_slot_response.dart';

final userProvider = FutureProvider.autoDispose<UserModel>(
  (ref) async {
    final token = ref.cancelToken();
    final link = ref.cacheFor();
    String staffCode = await Preferences.getPreference("staffCode", "");
    String userType = await Preferences.getPreference("userType", "");
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref.watch(userRepoProvider).getuserDetails(
        userType: userType, userId: staffCode, cancelToken: token);

    return result.when(
      (sucess) {
        return sucess;
      },
      (error) {
        link.close();
        throw error;
      },
    );
  },
  name: "userProvider",
);

final tomorrowSessionProvider = FutureProvider.autoDispose<AllotedSlotResponse>(
  (ref) async {
    final token = ref.cancelToken();
    final link = ref.cacheFor();
    String staffCode = await Preferences.getPreference("staffCode", "");
    final currentDate = DateTime.now();
    DateTime yesterday = currentDate.add(const Duration(days: 1));
    final date = DateFormat('MM/dd/yyyy').format(yesterday);
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref.watch(dashboardRepoProvider).getAllotedSlotDetails(
        userId: staffCode, date: date, cancelToken: token);

    return result.when(
      (sucess) {
        return sucess;
      },
      (error) {
        link.close();
        throw error;
      },
    );
  },
  name: "tomorrowSessionProvider",
);

final applyLeaveProvider =
    AutoDisposeAsyncNotifierProvider<ApplyleaveNotifier, ApplyLeaveState>(
  () => ApplyleaveNotifier(),
  name: "applyLeaveProvider",
);
