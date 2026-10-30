import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  PreferencesService(this._prefs);
  final SharedPreferences _prefs;

  static const _localeKey = 'locale';
  static const _themeKey = 'theme_mode';

  String? get localeCode => _prefs.getString(_localeKey);
  Future<void> setLocaleCode(String code) => _prefs.setString(_localeKey, code);

  String? get themeMode => _prefs.getString(_themeKey);
  Future<void> setThemeMode(String mode) => _prefs.setString(_themeKey, mode);
}
