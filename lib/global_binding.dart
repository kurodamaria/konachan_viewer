import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konachan_viewer/funs/theme.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class GlobalBinding extends Bindings {
  GlobalBinding() {
    // todo change theme upon start
  }

  @override
  void dependencies() {
    Get.lazyPut<Network>(() => _NetworkImpl());
    Get.put<LocalStorage>(_LocalStorageImpl());
  }
}

abstract class Network {}

class _NetworkImpl implements Network {}

abstract class LocalStorage {
  static const kThemeModeKey = 'ThemeMode';

  ThemeMode get theme;

  set theme(ThemeMode themeMode);
}

class _LocalStorageImpl implements LocalStorage {

  _LocalStorageImpl() {
    _initializeAsync();
  }

  late ThemeMode _theme;

  _initializeAsync() async {
    await _initializeThemeMode();
  }

  _initializeThemeMode() async {
    listener(String? event) {
      _theme = stringToThemeMode(event ?? '');
      Get.changeThemeMode(_theme);
    };
    prefs.getStringStream(LocalStorage.kThemeModeKey).listen(listener);
  }

  RxSharedPreferences get prefs => RxSharedPreferences.getInstance();

  @override
  ThemeMode get theme => _theme;

  @override
  set theme(ThemeMode themeMode) =>
      prefs.setString(LocalStorage.kThemeModeKey, themeModeToString(themeMode));
}
