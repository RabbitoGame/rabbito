import 'dart:async';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/fortune-wheel/wheel.dart';
import '../custom_container.dart';

class FortuneWheelPage extends StatelessWidget {
  StreamController<int> controller = StreamController<int>();
  Random _random = Random();
  int max = 10;
  var radius ;
  var lowPadding ;
  var highPadding ;
  var backButtonSize ;
  @override
  Widget build(BuildContext context) {
     radius = SizeConfig.blockSizeHorizontal*1;
     lowPadding =SizeConfig.blockSizeHorizontal*1;
     highPadding =SizeConfig.blockSizeHorizontal*3;
     backButtonSize =SizeConfig.blockSizeHorizontal*12;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
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
            padding:  EdgeInsets.all(lowPadding),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(highPadding),
                    child: Column(
                      children: [
                        Expanded(
                          child: watchAds(),
                          flex: 1,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Align(
                                child: Image.asset(
                                  ImageStrings.gameHomeRoulette2Asset,
                                  // width: 300,
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Wheel(controller),
                                alignment: Alignment.center,
                              ),
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
        Positioned(
          child: InkWell(
            child: Image.asset(
              ImageStrings.gameHomeClose2Asset,
              width: backButtonSize,
            ),
            onTap: () => Navigator.of(context).pop(),
          ),
          top: 0,
          right: 0,
        ),
      ],
    );
  }

  watchAds() {
    return Material(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(radius*2),
      child: InkWell(
        onTap: () {
          //todo call ads api
        },
        child: Padding(
          padding:  EdgeInsets.all(lowPadding),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(lowPadding),
                  child: Image.asset(
                    ImageStrings.widgetsAd3Asset,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: AutoSizeText(
                  "watch video for another try!",
                  textAlign: TextAlign.start,
                  minFontSize: 10,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,

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
