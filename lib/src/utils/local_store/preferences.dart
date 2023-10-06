import 'package:shared_preferences/shared_preferences.dart';

import '../../features/authentication/model/user_model.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

const String _storageKey = "Appli_";

class Preferences {
  static Future<bool?> setPreference(String name, dynamic value) async {
    final SharedPreferences prefs = await _prefs;
    if (value is String) {
      return prefs.setString(_storageKey + name, value);
    } else if (value is int) {
      return prefs.setInt(_storageKey + name, value);
    } else if (value is bool) {
      return prefs.setBool(_storageKey + name, value);
    } else if (value is List<String>) {
      return prefs.setStringList(_storageKey + name, value);
    }
    return null;
  }

  static Future<dynamic> getPreference(
      String name, dynamic defaultValues) async {
    final SharedPreferences prefs = await _prefs;
    if (defaultValues is String) {
      return prefs.getString(_storageKey + name) ?? defaultValues;
    } else if (defaultValues is int) {
      return prefs.getInt(_storageKey + name) ?? defaultValues;
    } else if (defaultValues is bool) {
      return prefs.getBool(_storageKey + name) ?? defaultValues;
    } else if (defaultValues is List<String>) {
      return prefs.getStringList(_storageKey + name) ?? defaultValues;
    }
  }

  static Future<bool> saveUser(UserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isLogin', responseModel.isLogin!);
    sp.setString('staffCode', responseModel.staffCode!);
    return true;
  }

  static Future<UserModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin');
    return UserModel(isLogin: isLogin);
  }

  static Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
