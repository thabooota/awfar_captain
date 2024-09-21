import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences sharedPreferences;
  static late FlutterSecureStorage flutterSecureStorage;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    flutterSecureStorage = const FlutterSecureStorage();
  }

  static dynamic getData({required String key}) => sharedPreferences.get(key);

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    return await sharedPreferences.setDouble(key, value);
  }

  static Future<bool> removeData({
    required String key,
  }) async =>
      await sharedPreferences.remove(key);

  static  setSecuredString({required String key, required String value}) async {
    await flutterSecureStorage.write(key: key, value: value);
  }

  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    print('${await flutterSecureStorage.read(key: key)}');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  static deleteSecuredString({required String key}) async {
    await flutterSecureStorage.delete(key: key);
  }
}
