import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/fortune_wheel.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                ImageStrings.gameHomeRouletteAsset,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(

                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(20),
                    ),
                    insetPadding:const EdgeInsets.symmetric(vertical: 160.0 , horizontal: 40) ,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: FortuneWheelPage(),
                  );
                },
              );
            },
            innerColor: Colors.redAccent,
            outerColor: Colors.red,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 10,
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(ImageStrings.appbarCupAsset),
                  Text(
                    "YOUR\nRANK?!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            onPressed: () {},
            innerColor: Colors.green,
            outerColor: Colors.greenAccent,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          flex: 4,
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(ImageStrings.gameHomeSettingsAsset),
            ),
            onPressed: () {},
            innerColor: Colors.redAccent,
            outerColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

xpWidget() {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Positioned(
        top: 8,
        left: 20,
        child: Container(
          width: 120,
          height: 25,
          child: LiquidLinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.blue),
            // Defaults to the current Theme's accentColor.
            center: Text(
              '30/100',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontFamily: 'Railway',
                fontSize: 16.0,
              ),
            ),
            borderColor: Colors.blue,
            borderWidth: 2.0,
            borderRadius: 12.0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage(ImageStrings.appbarStarAsset),
            width: 45,
          ),
          Positioned(
            top: 15,
            left: 12,
            child: Text(
              "12",
              style: TextStyle(
                fontSize: 15,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
