import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/localization_service.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/model/user_preferences.dart';
import 'package:rabbito/view/init/introduction.dart';
import 'package:rabbito/view/init/splash.dart';
import '../navigation-pages/homepage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.green, // navigation bar color
    ));

    return GetMaterialApp(
      builder: (context, child) => FlutterSmartDialog(child: child),
      theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.yellowAccent,
          scaffoldBackgroundColor: Colors.purple),
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
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Colors.white, // navigation bar color
            ));
            return IntroductionScreen();
          } else {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              systemNavigationBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(0xff301b49), // navigation bar color
            ));
            return Container(
                child: HomePage(title: 'Rabbito'), color: Colors.red);
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
    await _prefs.then((sharedPref) async {
      //check if it is first time to run app(for splash screen)
      if (sharedPref.get("firstEnter") == null ||
          sharedPref.getBool("firstEnter")!) {
        sharedPref.setBool("firstEnter", true);
        AppController.appController.firstEntrance.value = true;
      } else {
        AppController.appController.firstEntrance.value = false;
      }
      // check if user exists and then try to log in
      print("inside init prefs");
      if (sharedPref.containsKey(UserStrings.username)) {
        print("before in in");
        // User.logOut();
        User user = await UserPreferences.getUser();
        print("in in");
        print(user.toString());
        var result = await User.getAccessToken(
          refreshToken: user.refreshToken!,
        );
        if (result[RequestStrings.status]) {

          user.refreshToken = result[UserStrings.refreshToken];
          user.accessToken = result[UserStrings.accessToken];
          AppController.appController.currUser = user.obs;
          // var ans = await User.getUserDetails();
          // var data =ans["data"];
          // print(ans.toString());
          // AppController.appController.currUser!.update((usi) {
          //   usi.xp = data[]
          // });

        } else {
          UserPreferences.removeUser();
        }
      } else {
        UserPreferences.removeUser();
      }
    });
    WidgetsBinding.instance!.addObserver(new _Handler());

    await Future.delayed(Duration(seconds: 0));
  }
}

class _Handler extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    if (state == AppLifecycleState.resumed) {
      AppController.appController.menuMusicAudioPlayer
          .resume(); // Audio
      await UserPreferences.getUser();
// player is a custom class with resume and pause static methods
    } else {
      AppController.appController.menuMusicAudioPlayer.pause();
      UserPreferences.saveMusic();
      if(AppController.isLoggedIn()){
        print("background opendddedd");
        await UserPreferences.saveUser(AppController.appController.currUser!.value);


      }
    }
  }
}
