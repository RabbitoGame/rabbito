import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/view/widgets/fortune-wheel/wheel_constants.dart';
import 'package:rabbito/view/widgets/loading.dart';

import '../custom_container.dart';

class Wheel extends StatelessWidget {
  StreamController<int> controller;
  WheelController wheelController = Get.put(WheelController());

  Wheel(this.controller);

  var radius;
  var lowPadding;
  var highPadding;
  var backButtonSize;
  var iconWidth;
  AutoSizeGroup group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("height inside wheel: " + SizeConfig.screenHeight.toString());
    radius = SizeConfig.blockSizeHorizontal * 1;
    lowPadding = SizeConfig.blockSizeHorizontal * 1;
    highPadding = SizeConfig.blockSizeHorizontal * 3;
    backButtonSize = SizeConfig.blockSizeHorizontal * 12;
    iconWidth = SizeConfig.blockSizeHorizontal * 20;

    double width = SizeConfig.width1 / 2;

    return FortuneWheel(
      onAnimationEnd: () => onAnimationEnd(context),
      animateFirst: false,
      indicators: [
        FortuneIndicator(
          child: Stack(
            children: [
              Positioned(
                top: -SizeConfig.padding3,
                right: 0,
                left: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent.withOpacity(0.5),
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    size: iconWidth,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          alignment: Alignment.topCenter,
        )
      ],
      physics: NoPanPhysics(),
      duration: Duration(seconds: 0),
      selected: controller.stream,
      items: List<FortuneItem>.generate(fortuneWheelItems.length, (e) {
        return myItem(
          color: fortuneWheelItems.elementAt(e)["color"] as Color,
          prize: fortuneWheelItems.elementAt(e)["prize"] as int,
          image: fortuneWheelItems.elementAt(e)["image"] as String,
          width: (fortuneWheelItems.elementAt(e)["isCoin1"] as bool)
              ? width / 2
              : width,
          isCoin1: fortuneWheelItems.elementAt(e)["isCoin1"] as bool,
        );
      }).toList(),
    );
  }

  confetti() {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: wheelController.controller.value,
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

  void onAnimationEnd(context) async {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: EdgeInsets.symmetric(
          vertical: SizeConfig.height3 * 1.3,
          horizontal: SizeConfig.width3,
        ),
        child: FutureBuilder(
          future: doTransaction(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (!snapshot.hasError) {
                  return showWheelPrize(context);
                } else {
                  return Text(snapshot.error.toString());
                }
                break;
              case ConnectionState.waiting:
                return LoadingWidget(Indicator.ballBeat);
              default:
                return Text("default");
            }
          },
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(radius * 3),
        ),
        backgroundColor: Colors.amber,
      ),
    );
    wheelController._controller.value.play();
  }

  myItem({
    required int prize,
    required String image,
    required double width,
    required Color color,
    isCoin1 = false,
  }) {
    return item(
      widget: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Expanded(
            child: AutoSizeText(
              prize == 0 ? "" : prize.toString(),
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
            child: Container(
              padding: isCoin1
                  ? EdgeInsets.all(SizeConfig.padding3)
                  : EdgeInsets.all(highPadding),
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 0.45,
                  colors: [
                    Colors.white,
                    color,
                  ],
                ),
              ),
              child: Image.asset(
                image,
              ),
            ),
          ),
        ],
      ),
      color: color,
      borderColor: color,
    );
  }

  bool setPrize() {
    if (WheelController.winValue.value == 3 ||
        WheelController.winValue.value == 9) {
      int x = Random().nextInt(2);
      if (x == 0) {
        wheelController.imagePrize.value = ImageStrings.heartPacks;
        wheelController.amountPrize.value = Random().nextInt(2) + 1;
      } else {
        wheelController.imagePrize.value = ImageStrings.coinPacksPackage1;
        wheelController.amountPrize.value = Random().nextInt(10) + 10;
      }
      return x == 0;
    } else {
      wheelController.amountPrize.value = (fortuneWheelItems
          .elementAt(WheelController.winValue.value)["prize"]) as int;
      wheelController.imagePrize.value = (fortuneWheelItems
          .elementAt(WheelController.winValue.value)["image"]) as String;
      return (wheelController.imagePrize.value == ImageStrings.heartPacks);
    }
  }

  showWheelPrize(context) {
    var flex = 3;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.padding2, vertical: SizeConfig.padding3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          confetti(),
          Expanded(
            flex: flex,
            child: Center(
              child: AutoSizeText(
                "CONGRATULATIONS!!!",
                maxLines: 1,
                textAlign: TextAlign.center,
                minFontSize: 12,
              ),
            ),
          ),
          Expanded(
            flex: flex,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.padding1),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(() {
                      return AutoSizeText(
                        "you won ${wheelController.amountPrize.value} ",
                        textAlign: TextAlign.end,
                        minFontSize: 10,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      );
                    }),
                  ),
                  Obx(() {
                    return Image.asset(
                      wheelController.imagePrize.value,
                      width: iconWidth,
                      // width: 40,
                    );
                  }),
                ],
              ),
            ),
          ),
          Spacer(),
          Expanded(
            flex: flex,
            child: CustomContainer(
              // minHeight: iconWidth * 1.2,
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
          ),
        ],
      ),
    );
  }

  doTransaction() async {
    bool isHeart = setPrize();

    var result = await User.transactions(
      amount: wheelController.amountPrize.value,
      isIncrease: true,
      isHeart: isHeart,
    );
    if (result[RequestStrings.status]) {
      if (isHeart) {
        User.addHeart(wheelController.amountPrize.value);
      } else {
        var x =AppController.appController.currUser!.value.coin! +
            wheelController.amountPrize.value;
        AppController.appController.currUser!.update(( user) =>
            (user as User).coin =x );

      }
    }
  }
}

class WheelController extends GetxController {
  Rx<ConfettiController> _controller =
      ConfettiController(duration: const Duration(seconds: 10)).obs;
  static RxInt winValue = 0.obs;
  RxString imagePrize = "".obs;
  RxInt amountPrize = 0.obs;

  Rx<ConfettiController> get controller => _controller;

  set controller(Rx<ConfettiController> value) {
    _controller = value;
  }

  static setWinValue(StreamController cont) {
    winValue.value = Random().nextInt(fortuneWheelItems.length);
    print(winValue.value);
    cont.add(winValue.value);
  }
}
