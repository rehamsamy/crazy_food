import 'dart:convert';

import 'package:crazy_food/data/model/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LocalStorage {
  static final GetStorage _box = GetStorage();
  static const String languageKey = 'language';

  // static const String apiToken = 'token';
  static const String loginKey = 'loginKey';
  static const String userModel = 'userModel';

  static Future init() async {
    await GetStorage.init();
    if (GetStorage().read(languageKey) == null) {
      await setString(languageKey, 'ar');
    }
  }

  // static String getUserToken = getString(apiToken) ?? 'No Token';

  static bool isAr = GetStorage().read(languageKey) == 'ar';

  static bool isLoggedIn = getBool(loginKey);

  static UserModel? getUser = getString(userModel) == null
      ? null
      : UserModel.fromJson(jsonDecode(
          getString(userModel) ?? '{}',
        ));

  static Future<void> saveUser(UserModel model) async {
    await setBool(loginKey, true);
    await setString(userModel, jsonEncode(model.toJson()));
    Get.log('user ${model.name} saved to local storage');
  }

  /// ===========================================================
  static Future setString(String key, String value) async {
    await GetStorage().write(key, value);
  }

  static String? getString(String key) {
    String? value = GetStorage().read(key);
    return value;
  }

  static Future setBool(String key, bool value) async {
    await GetStorage().write(key, value);
  }

  static bool getBool(String key) {
    bool? value = GetStorage().read(key);
    return value ?? false;
  }

  static setInt(String key, int value) async {
    await GetStorage().write(key, value);
  }

  static int getInt(String key) {
    return GetStorage().read(key) ?? 0;
  }

  static Future<void> signOut() async {
    await _box.erase();
  }
}
