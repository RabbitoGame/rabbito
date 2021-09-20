import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/profile/user_statistics.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/fortune-wheel/fortune_wheel.dart';

import 'settings_widget.dart';

class GameAppBar extends StatelessWidget {
  const GameAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: xpWidget(),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: CustomContainer(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Image.asset(ImageStrings.gameHomeSettingsAsset),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return myDialog(
                            widget: SettingsWidget(),
                            horizontal: 20,
                            vertical: 60);
                      },
                    );
                  },
                  innerColor: Colors.transparent,
                  // outerColor: Color(0xff4e6131),
                  outerColor: Colors.black54,
                  x: 3,
                  y: 3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
          flex: 8,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          ImageStrings.gameHomeRouletteAsset,
                        ),
                        Text(
                          "TRY YOUR\nLUCK!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    // child: Image.asset(
                    //   ImageStrings.gameHomeRouletteAsset,
                    // ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return myDialog(
                            widget: FortuneWheelPage(),
                            vertical: 60,
                            horizontal: 20);
                      },
                    );
                  },
                  innerColor: Colors.teal,
                  outerColor: Colors.tealAccent,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
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
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    // child: Image.asset(ImageStrings.appbarCupAsset),
                  ),
                  onPressed: () => Get.to(RankingMenu()),

                  outerColor: Colors.lightGreen,
                  innerColor: Color(0xff0b5a5a),
                ),
              ),
            ],
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
      insetPadding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: widget,
    );
  }
}
