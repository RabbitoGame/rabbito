import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.green
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 60.0,
                          child: Image.asset('assets/images/logo.png', width: 120.0)
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10.0)
                      ),
                      Text(
                        'Rabbito',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 20.0)
                    ),
                    Text(
                      'Card game to learn english as easy as pie!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}