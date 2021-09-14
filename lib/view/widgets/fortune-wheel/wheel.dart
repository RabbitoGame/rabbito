import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rabbito/global/strings/image_strings.dart';

import '../custom_container.dart';

class Wheel extends StatelessWidget {
  StreamController<int> controller;
  WheelController _wheelController = Get.put(WheelController());

  Wheel(this.controller);

  @override
  Widget build(BuildContext context) {
    double width = 47;

    return FortuneWheel(
      onAnimationEnd: () => onAnimationEnd(context),
      animateFirst: false,
      physics: NoPanPhysics(),
      duration: Duration(seconds: 4),
      selected: controller.stream,
      items: [
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelCoin2Asset,
              width: width - 5,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelCash2Asset,
              width: width + 10,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelHeartPlus6Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelMystery1Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelCoin2Asset,
              width: width - 5,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelMoneyBag3Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelHeartPlus6Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelMystery1Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelCoin2Asset,
              width: width - 5,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
        item(
            widget: Image.asset(
              ImageStrings.gameHomeWheelMoneyBag1Asset,
              width: width,
            ),
            color: Colors.black,
            borderColor: Colors.yellow),
      ],
    );
  }

  confetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _wheelController.controller.value,
        blastDirection: -pi/2,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          widget,
        ],
      ),
      style: FortuneItemStyle(
          color: color, borderColor: borderColor, borderWidth: 5),
    );
  }
  void onAnimationEnd(context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.amber,
        title: Column(
          children: [
            confetti(),

            Text(
              "CONGRATULATIONS!!!",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "you won 13 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  ImageStrings.appbarHeartAsset,
                  width: 40,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CustomContainer(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "OK",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
}

class WheelController extends GetxController {
  Rx<ConfettiController> _controller =
      ConfettiController(duration: const Duration(seconds: 10)).obs;

  Rx<ConfettiController> get controller => _controller;

  set controller(Rx<ConfettiController> value) {
    _controller = value;
  }
}
