import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static String ksharedlangKey = 'lang';
  static String ksharedModeKey = 'isDark';

  // ignore: missing_return
  static Future<bool> saveLang(String val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ksharedlangKey, val);
  }

  // ignore: missing_return
  static Future<bool> saveAppMode(bool val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(ksharedModeKey, val);
  }

  static getLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String lang = sharedPreferences.get(ksharedlangKey);
    return lang;
  }

  static getAppMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isDark = sharedPreferences.get(ksharedModeKey);
    return isDark;
  }
}
