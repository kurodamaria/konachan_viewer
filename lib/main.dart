import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'viewers/konachan_viewer_home.dart';

main() {
  runApp(GetMaterialApp(
    home: const KonachanViewerHome(),
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white
    ),
  ));
}
