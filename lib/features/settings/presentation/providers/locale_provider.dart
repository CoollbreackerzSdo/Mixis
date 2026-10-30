import 'package:flutter/material.dart';

import 'package:mixis/core/storage/preferences_service.dart';

class LocaleProvider extends ChangeNotifier {
  LocaleProvider(this._prefs) {
    final code = _prefs.localeCode;
    if (code != null && code.isNotEmpty) {
      _locale = Locale(code);
    }
  }

  final PreferencesService _prefs;
  Locale? _locale;
  Locale? get locale => _locale;

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    await _prefs.setLocaleCode(locale.languageCode);
    notifyListeners();
  }
}
