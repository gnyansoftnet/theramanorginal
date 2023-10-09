import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/features/user/data/repo/user_repo_pod.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cache_ext.dart';
import 'package:theraman/src/utils/extensions/riverpod_ext/cancel_ext.dart';
import '../../../../utils/local_store/preferences.dart';

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
