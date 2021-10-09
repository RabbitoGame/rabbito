import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';

import 'package:rabbito/controller/login_register_controller.dart';
import 'package:rabbito/global/size_config.dart';

class LoginScreen extends StatelessWidget {
  LoginRegisterController _controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    var radius = SizeConfig.radius3 * 3;

    return Scaffold(
      backgroundColor: const Color(0xffd4d2d2),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Align(
                  child: Image.asset(
                    'assets/images/rabbit/Waving.png',
                  ),
                  alignment: Alignment.topRight,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.padding3 * 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Login',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: AutoSizeText(
                            'Please sign in to continue',
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.grey),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                  right: SizeConfig.padding3 * 2,
                  left: SizeConfig.padding3 * 2,
                  top: SizeConfig.padding1,
                  bottom: SizeConfig.padding3),
              child: fields(radius),
            ),
          ),
        ],
      ),
    );
  }

  fields(radius) {
    var bottomFlex = 10;
    return Column(
      children: [
        Expanded(
          flex: bottomFlex,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Username",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val!.length == 0) {
                return "Username cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Spacer(),
        Expanded(
          flex: bottomFlex,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Password",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(),
              ),
              //fillColor: Colors.green
            ),
            validator: (val) {
              if (val!.length == 0) {
                return "Password cannot be empty";
              } else {
                return null;
              }
            },
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Spacer(),
        Expanded(
          flex: bottomFlex - 3,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(width: SizeConfig.width5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return Colors.green;
                      return Colors.green; // Use the component's default.
                    },
                  ),
                ),
                onPressed: () {
                  _controller.login("yasin5", "y124112");
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      SizeConfig.padding2, 0, SizeConfig.padding2, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'LOGIN',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: SizeConfig.width1 * 0.8,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Expanded(
          flex: bottomFlex,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Expanded(
                child: FittedBox(
                  child: Text(
                    'Don\'t have an account?',
                    textAlign: TextAlign.end,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                child: FlatButton(
                  child: AutoSizeText(
                    ' Sign up',
                    maxLines: 1,
                    minFontSize: 10,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.green),
                  ),
                  onPressed: () {
                    AppController.appController.loginScreenStatus.value =
                        !AppController.appController.loginScreenStatus.value;
                    AppController.appController.update();
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
