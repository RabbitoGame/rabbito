import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/game-page/top_row_icon_button.dart';
import 'custom_container.dart';

class FortuneWheelPage extends StatelessWidget {
  StreamController<int> controller = StreamController<int>();
  WheelController _wheelController = Get.put(WheelController());
  Random _random = Random();
  int max = 7;

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

                // Colors.deepPurpleAccent,
                // Colors.purpleAccent
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
                      children: [
                        FortuneWheel(
                          onAnimationEnd: () {
                            //todo decrease tickets
                          },
                          animateFirst: false,
                          physics: NoPanPhysics(),
                          duration: Duration(seconds: 5),
                          selected: controller.stream,
                          items: [
                            FortuneItem(child: Text('1')),
                            FortuneItem(child: Text('2')),
                            FortuneItem(child: Text('3')),
                            FortuneItem(child: Text('4')),
                            FortuneItem(child: Text('5')),
                            FortuneItem(child: Text('6')),
                            FortuneItem(child: Text('7')),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Obx(() {
                            return ConfettiWidget(
                              confettiController:
                                  _wheelController.controllerCenter.value,
                              blastDirection: pi,
                              // radial value - LEFT
                              particleDrag: 0.05,
                              // apply drag to the confetti
                              emissionFrequency: 0.05,
                              // how often it should emit
                              numberOfParticles: 20,
                              // number of particles to emit
                              gravity: 0.05,
                              // gravity - or fall speed
                              shouldLoop: true,
                              colors: const [
                                Colors.green,
                                Colors.blue,
                                Colors.pink
                              ], // manually specify the colors to be used
                            );
                          }),
                        ),
                        Align(
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
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 15),
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
                            onPressed: () {},
                            innerColor: Colors.red,
                            outerColor: Colors.brown,
                          ),
                        )
                      ],
                    ),
                  ),
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
}

class WheelController extends GetxController {
  Rx<ConfettiController> controllerCenter =
      ConfettiController(duration: const Duration(seconds: 10)).obs;
}
