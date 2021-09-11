import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rabbito/controller/login_register_controller.dart';
import 'package:rabbito/view/login/register.dart';

class LoginScreen extends StatelessWidget {
  LoginRegisterController _controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: const Color(0xffd4d2d2),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child:   Padding(
                        padding: EdgeInsets.fromLTRB(55, 150, 0, 5),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35.0
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child:   Padding(
                        padding: EdgeInsets.fromLTRB(55, 5, 0, 60),
                        child: Text(
                          'Please sign in to continue',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55, 5, 55, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Username",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val!.length==0) {
                          return "Username cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(55, 5, 55, 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val!.length==0) {
                          return "Password cannot be empty";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 55, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(width: 140, height: 54),
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
                                  _controller.login(
                                    "yasin5",
                                    "y124112"
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'LOGIN',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.white,
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward, color: Colors.white)
                                    ],
                                  ),
                                )
                              // style: ElevatedButton.styleFrom(
                              //   shape: CircleBorder(),
                              //   padding: EdgeInsets.all(20),
                              //   primary: Colors.blue, // <-- Button color
                              //   onPrimary: Colors.red, // <-- Splash color
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Image.asset('assets/images/rabbit/Waving.png', width: 200.0),
              top: 20,
              right: 0
            ),
            Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0
                      ),
                    ),
                    FlatButton(
                      // splashColor: Colors.red,
                      color: const Color(0xffd4d2d2),
                      // textColor: Colors.white,
                      child: Text(
                        ' Sign up',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.green
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                      },
                    ),
                  ],
                ),
                bottom: 65,
              right: 0,
              left: 0,
            ),
          ],
        )
      ),
    );
  }
}
