import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/fortune-wheel/fortune_wheel.dart';

import 'settings_widget.dart';

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
                  return myDialog(widget: FortuneWheelPage() , vertical: 60 , horizontal:20 );
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
            onPressed: () => Get.to(RankingMenu()),
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
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return myDialog(widget: SettingsWidget(), horizontal: 20, vertical: 60);
                },
              );
            },
            innerColor: Colors.redAccent,
            outerColor: Colors.red,
          ),
        ),
      ],
    );
  }

  Widget myDialog({
    required Widget widget,
    double vertical = 160.0,
    double horizontal = 40,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal,),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: widget,
    );
  }
}


