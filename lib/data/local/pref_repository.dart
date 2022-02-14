import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefRepositoryKeys {
  static const String LOCALE = "LOCALE";
}

class PrefRepository {
  final SharedPreferences _preferences;
  PrefRepository(this._preferences);

  // ================================ LOCALE ================================
  Locale? getAppLanguage() {
    var langCode = _preferences.getString(PrefRepositoryKeys.LOCALE);
    if (langCode == null) return const Locale('en');
    return Locale(langCode);
  }

  Future<bool> setAppLanguage(Locale locale) {
    return _preferences.setString(
        PrefRepositoryKeys.LOCALE, locale.languageCode);
  }
}
