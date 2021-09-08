import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/localization_service.dart';
import 'package:rabbito/view/init/introduction.dart';
import 'package:rabbito/view/init/splash.dart';
import 'package:rabbito/view/navigation-pages/homepage.dart';
import 'package:rabbito/view/widgets/fortune_wheel.dart';
import 'package:rabbito/view/widgets/indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      home: FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else if (AppController.appController.firstEntrance.value) {
            return IntroductionScreen();
          } else {
            return HomePage(title: 'Rabbito');
            // return FortuneWheelPage();
          }
        },
      ),
      getPages: [
        GetPage(
          name: '/home-page',
          page: () => HomePage(title: 'Rabbito'),
        ),
      ],
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future initialize() async {
    AppController.appController = Get.put(AppController());
    _prefs.then((sharedPref) {
      if (sharedPref.get("firstEnter") == null ||
          sharedPref.getBool("firstEnter")!) {
        sharedPref.setBool("firstEnter", true);
        AppController.appController.firstEntrance.value = true;
      } else {
        AppController.appController.firstEntrance.value = false;
      }
    });

    await Future.delayed(Duration(seconds: 0));
  }
}
