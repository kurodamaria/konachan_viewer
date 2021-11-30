import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konachan_viewer/global_binding.dart';

import 'funs.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
    home: HomePage(),
    theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.white),
    darkTheme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
    themeMode: await initialThemeMode(),
    initialBinding: GlobalBinding(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Get.find<LocalStorage>().theme = ThemeMode.light;
            },
            child: Text('${ThemeMode.light}'),
          ),
          TextButton(
            onPressed: () {
              Get.find<LocalStorage>().theme = ThemeMode.dark;
            },
            child: Text('${ThemeMode.dark}'),
          ),
          TextButton(
            onPressed: () {
              Get.find<LocalStorage>().theme = ThemeMode.system;
            },
            child: Text('${ThemeMode.system}'),
          ),
        ],
      ),
    );
  }
}
