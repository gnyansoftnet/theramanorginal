import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/model/user_model.dart';
import 'package:theraman/src/features/user/data/repo/user_repo_pod.dart';
import '../../../../utils/local_store/preferences.dart';

final userProvider = FutureProvider.autoDispose<UserModel>(
  (ref) async {
    // final token = ref.cancelToken();
    // final link = ref.cacheFor();
    var staffCode = await Preferences.getPreference("staffCode", "");
    if (kDebugMode) {
      print("print staff code $staffCode");
    }
    final result = await ref
        .watch(userRepoProvider)
        .getuserDetails(userType: "T", userId: staffCode);

    return result.when(
      (sucess) {
        return sucess;
      },
      (error) {
        // link.close();
        throw error;
      },
    );
  },
  name: "userProvider",
);
