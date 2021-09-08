import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/game-page/top_row_icon_button.dart';

import 'custom_container.dart';

class FortuneWheelPage extends StatelessWidget {
  StreamController<int> controller = StreamController<int>();
  Random _random = Random();
  int max = 7;

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: FortuneWheel(
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
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
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
                                "2723",
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
                              right: -20,
                            ),
                            Positioned(
                              bottom: -10,
                              left: -30,
                              child: Image.asset(
                                ImageStrings.profileTicket2Asset,
                                width: 50,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
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
    );
  }
}
