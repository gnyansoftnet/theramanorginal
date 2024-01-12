import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theraman/src/features/authentication/application/providers/user_provider.dart';
import 'dart:convert';

import 'package:theraman/src/features/authentication/model/user_model.dart';

class UserNotifier extends AutoDisposeNotifier<UserModel?> {
  final _userKey = 'userBox';

  @override
  UserModel? build() {
    return getUser();
  }

  UserModel? getUser() {
    final box = ref.read(userBoxProvider);
    final response = box.get(_userKey);
    if (response != null && response != '') {
      final result = jsonDecode(response);
      return UserModel.fromJson(result);
    }
    return null;
  }

  void saveUser({required UserModel userModel}) async {
    final box = ref.read(userBoxProvider);
    await box.put(_userKey, jsonEncode(userModel));
    ref.invalidateSelf();
  }

  Future<bool> clearUser() async {
    final box = ref.read(userBoxProvider);
    await box.delete(_userKey);
    ref.invalidateSelf();
    return true;
  }
}
