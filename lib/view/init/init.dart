
import 'package:flutter/material.dart';
import 'package:rabbito/view/init/introduction.dart';
import 'package:rabbito/view/init/splash.dart';

class InitPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              home: SplashScreen(),
              debugShowCheckedModeBanner: false
          );
        } else {
          return MaterialApp(
              theme: ThemeData(
                  primaryColor: Colors.red,
                  accentColor: Colors.yellowAccent
              ),
              debugShowCheckedModeBanner: false,
              home: IntroductionScreen()
          );
        }
      },
    );
  }
}



class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
