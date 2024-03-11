import 'package:flutter_clean_mvvm/presentation/resources/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  AppPreference(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  String prefsKreLang = 'language_pref';

  Future<String> getAppLanguage() async {
    final language = _sharedPreferences.getString(prefsKreLang);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
    // return;
  }
}
