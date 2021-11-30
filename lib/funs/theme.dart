import 'package:flutter/material.dart';
import 'package:konachan_viewer/global_binding.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

String themeModeToString(ThemeMode themeMode) {
  switch(themeMode) {
    case ThemeMode.light:
      return 'light';
    case ThemeMode.dark:
      return 'dark';
    case ThemeMode.system:
      return 'system';
    default:
      throw ArgumentError('Unsupported theme mode type');
  }
}

ThemeMode stringToThemeMode(String themeModeString) {
  switch (themeModeString) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    case 'system':
      return ThemeMode.system;
    default:
      throw ArgumentError('Unsupported theme mode type');
  }
}

Future<ThemeMode> initialThemeMode() async {
  late final ThemeMode initialThemeMode;

  try {
    final instance = RxSharedPreferences.getInstance();
    initialThemeMode = stringToThemeMode(
        await instance.getString(LocalStorage.kThemeModeKey) ?? '');
  } catch (_) {
    // todo default to system theme mode for now
    initialThemeMode = ThemeMode.system;
  }

  return initialThemeMode;
}
