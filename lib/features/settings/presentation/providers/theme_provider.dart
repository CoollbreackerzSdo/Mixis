import 'package:flutter/material.dart';

import 'package:mixis/core/storage/preferences_service.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider(this._prefs) {
    final saved = _prefs.themeMode;
    if (saved == 'light') _mode = ThemeMode.light;
    else if (saved == 'dark') _mode = ThemeMode.dark;
    else _mode = ThemeMode.system;
  }

  final PreferencesService _prefs;
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  Future<void> setMode(ThemeMode mode) async {
    _mode = mode;
    final value = mode == ThemeMode.light
        ? 'light'
        : mode == ThemeMode.dark
            ? 'dark'
            : 'system';
    await _prefs.setThemeMode(value);
    notifyListeners();
  }
}
