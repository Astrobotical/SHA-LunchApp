import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static saveCredentials(
      {required String name,
      required bool isStudent,
      required String id,
      required String Email}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('Name', name);
    sharedPreferences.setBool('isStudent', isStudent);
    sharedPreferences.setString('ID', id);
    sharedPreferences.setString('Email', Email);
  }

  static Future<String?> getValueByKey({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }
  static Future<bool?> getValueByKeyBool({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key);
  }
  static Future<void> setAuthType({required String auth}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("AuthType", auth);
  }
  static Future<void> clear() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
