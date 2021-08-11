import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString("lang_code", languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case 'ar':
      _temp = Locale('ar', '');
      break;
    case 'en':
      _temp = Locale('en', '');
      break;
    default:
      _temp = Locale('ar', '');
  }
  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString("lang_code") ?? 'ar';
  return _locale(languageCode);
}
