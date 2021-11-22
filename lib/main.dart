import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konachan_viewer/controllers/network.dart';
import 'package:konachan_viewer/models/post.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:disposebag/disposebag.dart';

import 'pages/konachan_viewer_home.dart';

setupDependencies() async {
  Get.put(RxList<Post>(), tag: 'home');
  Get.put(Network());
  DisposeBagConfigs.logger = null;
  Get.put(RxSharedPreferences(await SharedPreferences.getInstance(),
      kReleaseMode ? null : const RxSharedPreferencesDefaultLogger()));
  Get.find<RxSharedPreferences>().getStringStream('themeMode').listen((event) {
    if (event == 'light') {
      Get.changeThemeMode(ThemeMode.light);
    } else if (event == 'dark') {
      Get.changeThemeMode(ThemeMode.dark);
    }
  });
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();

  runApp(GetMaterialApp(
    home: const KonachanViewerHome(),
    theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white),
    darkTheme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    themeMode:
        (await Get.find<RxSharedPreferences>().getString('themeMode')) == 'dark'
            ? ThemeMode.dark
            : ThemeMode.light,
  ));
}
