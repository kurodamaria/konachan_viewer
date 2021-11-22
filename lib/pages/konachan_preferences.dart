import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

class KonachanPreferencesPage extends StatelessWidget {
  KonachanPreferencesPage({Key? key}) : super(key: key);

  final rxPrefs = Get.find<RxSharedPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            StreamBuilder<String?>(
                stream: rxPrefs.getStringStream('themeMode'),
                builder: (context, snapshot) {
                  return Switch(
                    value: snapshot.data == 'dark',
                    onChanged: (val) {
                      if (val == false) {
                        rxPrefs.setString('themeMode', 'light');
                      } else {
                        rxPrefs.setString('themeMode', 'dark');
                      }
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
