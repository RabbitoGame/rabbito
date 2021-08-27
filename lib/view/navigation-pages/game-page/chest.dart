import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chest extends StatelessWidget {
  const Chest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          padding: EdgeInsets.all(5),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Image.asset(
              "assets/images/game-home/chest2.png",
            ),
            Center(
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.white70,
                //   borderRadius: BorderRadius.circular(5),
                // ),
                padding: EdgeInsets.all(5),
                child: Text(
                  "5 hour",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
