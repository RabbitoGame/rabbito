import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/view/login/login.dart';
import 'package:rabbito/view/login/register.dart';
import 'package:rabbito/view/navigation-pages/profile/profile.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

class LoginManager extends StatelessWidget {
  const LoginManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppController.isLoggedIn()
          ? profileMenu(context)
          : AppController.isLoginScreen()
              ? LoginScreen()
              : RegisterScreen();
    });
  }
}
