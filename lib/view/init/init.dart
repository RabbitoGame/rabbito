import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/view/init/introduction.dart';
import 'package:rabbito/view/init/splash.dart';
import 'package:rabbito/view/navigation-pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              home: SplashScreen(), debugShowCheckedModeBanner: false);
        } else {
          return MaterialApp(
              theme: ThemeData(
                  primaryColor: Colors.red, accentColor: Colors.yellowAccent),
              debugShowCheckedModeBanner: false,
              home: AppController.appController.firstEntrance.value
                  ? IntroductionScreen()
                  : HomePage(title: 'Rabbito'));
        }
      },
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

    await Future.delayed(Duration(seconds: 3));
  }
}
