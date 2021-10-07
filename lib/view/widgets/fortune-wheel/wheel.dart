import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';

import '../custom_container.dart';

class Wheel extends StatelessWidget {
  StreamController<int> controller;
  WheelController _wheelController = Get.put(WheelController());

  Wheel(this.controller);

  var radius;
  AutoSizeGroup group = AutoSizeGroup();
  var lowPadding;

  var highPadding;

  var backButtonSize;

  var iconWidth;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("height inside wheel: " + SizeConfig.screenHeight.toString());
    radius = SizeConfig.blockSizeHorizontal * 1;
    lowPadding = SizeConfig.blockSizeHorizontal * 1;
    highPadding = SizeConfig.blockSizeHorizontal * 3;
    backButtonSize = SizeConfig.blockSizeHorizontal * 12;
    iconWidth = SizeConfig.blockSizeHorizontal * 12;

    double width = 47;

    return FortuneWheel(
      onAnimationEnd: () => onAnimationEnd(context),
      animateFirst: false,
      indicators: [
        FortuneIndicator(
          child: Icon(
            Icons.arrow_downward_outlined,
            size: iconWidth,
            color: Colors.amber,
          ),
          alignment: Alignment.topCenter,
        )
      ],
      physics: NoPanPhysics(),
      duration: Duration(seconds: 0),
      selected: controller.stream,
      items: [
        myItem(
          image: ImageStrings.gameHomeWheelCoin2Asset,
          width: width,
          color: Colors.lightGreen,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelCash2Asset,
          width: width,
          color: Colors.green,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelHeartPlus6Asset,
          width: width,
          color: Colors.teal,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelMystery1Asset,
          width: width,
          color: Colors.blue,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelCoin2Asset,
          width: width,
          color: Colors.purple,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelMoneyBag3Asset,
          width: width,
          color: Colors.deepPurple,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelHeartPlus6Asset,
          width: width,
          color: Colors.red,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelMystery1Asset,
          width: width,
          color: Colors.deepOrange,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelCoin2Asset,
          width: width,
          color: Colors.orange,
          prize: "10",
        ),
        myItem(
          image: ImageStrings.gameHomeWheelMoneyBag1Asset,
          width: width,
          color: Colors.amber,
          prize: "10",
        ),
      ],
    );
  }

  confetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _wheelController.controller.value,
        blastDirection: -pi / 2,
        // radial value - LEFT
        particleDrag: 0.05,
        // apply drag to the confetti
        emissionFrequency: 0.05,
        // how often it should emit
        numberOfParticles: 2,
        // number of particles to emit
        gravity: 0.05,
        // gravity - or fall speed
        shouldLoop: true,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink
        ], // manually specify the colors to be used
      ),
    );
  }

  item(
      {required Widget widget,
      required Color color,
      required Color borderColor}) {
    return FortuneItem(
      child: widget,
      style: FortuneItemStyle(
          color: color, borderColor: borderColor, borderWidth: 5),
    );
  }

  void onAnimationEnd(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(radius*3),
        ),

        backgroundColor: Colors.amber,
        title: Column(
          children: [
            confetti(),
            AutoSizeText(
              "CONGRATULATIONS!!!",
              maxLines: 1,
              textAlign: TextAlign.center,
              minFontSize: 12,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    "you won 13 ",
                    textAlign: TextAlign.center,
                    minFontSize: 10,
                    maxLines: 1,

                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Image.asset(
                  ImageStrings.appbarHeartAsset,
                  width: iconWidth,
                  // width: 40,
                ),
              ],
            ),
            SizedBox(
              height: iconWidth * 0.2,
            ),
            CustomContainer(
              minHeight: iconWidth * 1.2,
              onPressed: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.all(lowPadding),
                child: AutoSizeText(
                  "OK",
                  maxLines: 1,
                  minFontSize: 10,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              innerColor: Colors.deepPurple,
              outerColor: Colors.brown,
            ),
          ],
        ),
      ),
    );
    _wheelController._controller.value.play();
  }

  myItem(
      {required String prize,
      required String image,
      required double width,
      required Color color}) {
    return item(
      widget: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            child: AutoSizeText(
              prize,
              // "1",
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              minFontSize: 8,
              group: group,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(highPadding),
              child: Image.asset(
                image,
                // width: width - 5,
              ),
            ),
          ),
        ],
      ),
      color: color,
      borderColor: color,
    );
  }
}

class WheelController extends GetxController {
  Rx<ConfettiController> _controller =
      ConfettiController(duration: const Duration(seconds: 10)).obs;

  Rx<ConfettiController> get controller => _controller;

  set controller(Rx<ConfettiController> value) {
    _controller = value;
  }
}
