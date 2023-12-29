import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/global/model/user_model.dart';
import 'package:theraman/src/features/therapist/data/repo/therapist_repo_pod.dart';
import 'package:theraman/src/utils/extensions/cache_ext.dart';
import 'package:theraman/src/utils/extensions/cancel_ext.dart';
import 'package:theraman/src/utils/local_store/preferences.dart';

final userProvider = FutureProvider.autoDispose<UserModel>(
  (ref) async {
    final token = ref.cancelToken();
    String staffCode = await Preferences.getPreference("staffCode", "");
    String userType = await Preferences.getPreference("userType", "");
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref.watch(therapistRepoProvider).getuserDetails(
        userType: userType, userId: staffCode, cancelToken: token);

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
  name: "userProvider",
);
