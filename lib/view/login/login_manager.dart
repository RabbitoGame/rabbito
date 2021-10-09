import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/view/login/login.dart';
import 'package:rabbito/view/login/register.dart';

class LoginManager extends StatelessWidget {
  const LoginManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppController.appController.loginScreenStatus.value
          ? LoginScreen()
          : RegisterScreen();
    });
  }
}
