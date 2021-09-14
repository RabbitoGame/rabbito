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
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: watchAds(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                child: Image.asset(
                                  ImageStrings.gameHomeRoulette2Asset,
                                  width: 300,
                                ),
                                top: 90,
                              ),
                              Wheel(controller),
                            ],
                          ),
                          flex: 6,
                        ),
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

  watchAds() {
    return Material(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(5),

      child: InkWell(
        onTap: (){
          //todo call ads api
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  ImageStrings.widgetsAd3Asset,
                  ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "watch video for another try!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  rotateButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
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
