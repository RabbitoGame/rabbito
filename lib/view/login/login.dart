import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.green,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                child: Text(
                  'Login',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  'Please sign in to continue',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Email",
                    fillColor: Colors.green,
                    focusColor: Colors.green,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    //fillColor: Colors.green
                  ),
                  validator: (val) {
                    if(val!.length==0) {
                      return "Email cannot be empty";
                    }else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Password",
                    fillColor: Colors.green,
                    focusColor: Colors.green,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
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
              RoundedButtonWithIcon(
                onPressed: (){},
                icon:Icons.arrow_forward,
                title: "Rounded Button With Icon",
                textColor: Colors.blue,
                radius: 10.0,
                buttonColor: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
