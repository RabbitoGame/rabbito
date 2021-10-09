import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/controller/login_register_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/view/login/login.dart';

class RegisterScreen extends StatelessWidget {
  LoginRegisterController _controller = Get.put(LoginRegisterController());
  TextEditingController _usernameC = TextEditingController();
  TextEditingController _passwordC = TextEditingController();
  TextEditingController _emailC = TextEditingController();
  var flex ;
  var radius ;
  @override
  Widget build(BuildContext context) {
    flex = 10;
    radius = SizeConfig.radius3 * 3;
    return Scaffold(
      backgroundColor: const Color(0xffd4d2d2),
      body: Column(
        children: [
          Expanded(flex: 2, child: createAccount()),
          Expanded(flex: 5, child: registerForm()),
          Expanded(flex: 4, child: bottomStack()),
        ],
      ),
    );
  }

  void registerProcess()async {
    await _controller.register(
      _usernameC.value.text.trim(),
      _passwordC.value.text.trim(),
      _emailC.value.text.trim(),
    );
    String result = _controller.error.value;
    Get.snackbar("result", result);
  }

  bottomStack() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.padding3),
            child: Image.asset(
              'assets/images/rabbit/Eating_carrot.png',
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.padding3 * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    child: Text(
                      'Already have an account?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FlatButton(
                    child: Text(
                      ' Sign in',
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
        )
      ],
    );
  }

  createAccount() {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.padding3 * 2,
          left: SizeConfig.padding3 * 2,
          right: SizeConfig.padding3 * 2,
          bottom: SizeConfig.padding3),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Create Account',
          textAlign: TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }

  registerForm() {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.padding3,
          left: SizeConfig.padding3 * 2,
          right: SizeConfig.padding3 * 2,
          bottom: SizeConfig.padding1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: flex,
            child: TextFormField(
              controller: _usernameC,
              decoration: InputDecoration(
                labelText: "Username",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(radius),
                  borderSide: BorderSide(),
                ),
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
            child: TextFormField(
              controller: _passwordC,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
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
            flex: flex,
          ),
          Spacer(),
          Expanded(
            flex: flex,
            child: TextFormField(
              controller: _emailC,
              decoration: InputDecoration(
                labelText: "Email",
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
                  return "Email cannot be empty";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Spacer(),
          Expanded(
            flex: flex - 1,
            child: Align(
              alignment: Alignment.centerRight,
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
                    onPressed: registerProcess,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          SizeConfig.padding2, 0, SizeConfig.padding2, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: FittedBox(
                              child: Text(
                                'SIGN UP',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              fit: BoxFit.scaleDown,
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
          ),
        ],
      ),
    );
  }
}
