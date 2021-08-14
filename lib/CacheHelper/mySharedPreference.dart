import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static String ksharedlangKey = 'lang';

  // ignore: missing_return
  static Future<bool> saveLang(String val) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(ksharedlangKey, val);
  }

  static getLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String lang = sharedPreferences.get(ksharedlangKey);
    return lang;
  }
}
