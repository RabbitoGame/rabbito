import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/game-page/top_row_icon_button.dart';
import 'package:rabbito/view/widgets/fortune-wheel/wheel.dart';
import '../custom_container.dart';

class FortuneWheelPage extends StatelessWidget {
  StreamController<int> controller = StreamController<int>();
  Random _random = Random();
  int max = 10;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color(0xff070752),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              // transform
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                            top: 120,
                            child: Image.asset(
                              ImageStrings.gameHomeRoulette2Asset,
                              width: 300,
                            )),
                        Wheel(controller),
                        ticketWidget(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: rotateButton(),
                )
              ],
            ),
          ),
        ),
        Align(
          child: InkWell(
            child: Image.asset(
              ImageStrings.gameHomeClose2Asset,
              width: 50,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          alignment: Alignment.topRight,
        ),
      ],
    );
  }



  ticketWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(left: 15),
        width: 110,
        padding: const EdgeInsets.symmetric(
          horizontal: 7.0,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: Text(
                "723",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              child: TopRowIconButton(
                () {},
                Icon(
                  Icons.add_box,
                  size: 32,
                  color: Colors.black,
                ),
              ),
              right: -15,
            ),
            Positioned(
              bottom: -10,
              left: -30,
              child: Image.asset(
                ImageStrings.profileTicket2Asset,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  rotateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          Expanded(
            // flex: 5,
            child: CustomContainer(
              child: Text(
                "role!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => controller.add(_random.nextInt(max)),
              innerColor: Colors.red,
              outerColor: Colors.brown,
            ),
          )
        ],
      ),
    );
  }




}
