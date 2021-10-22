import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/view/navigation-pages/profile/user_statistics.dart';
import 'package:rabbito/view/navigation-pages/ranking/interface.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/fortune-wheel/fortune_wheel.dart';

import 'settings_widget.dart';

class GameAppBar extends StatelessWidget {
  AutoSizeGroup group = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(child: Obx(() {
                return xpWidget(
                  all: AppController.isLoggedIn() ? 1000 : 0,
                  part: AppController.isLoggedIn()
                      ? AppController.getXp()
                      : 0,
                  xpLevel: AppController.isLoggedIn()
                      ? AppController.getXpLevel()
                      : 0,
                  big: MediaQuery.of(context).size.width > 300,
                );
              })),
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
                          vertical: SizeConfig.screenHeight * 0.18,
                          horizontal: SizeConfig.screenWidth * 0.05,
                        );
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
                        Expanded(
                          child: AutoSizeText(
                            "TRY YOUR LUCK!",
                            textAlign: TextAlign.center,
                            minFontSize: 7,
                            maxLines: 2,
                            group: group,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
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
                          vertical: SizeConfig.screenHeight * 0.1,
                          horizontal: SizeConfig.screenWidth * 0.05,
                        );
                      },
                    );
                  },
                  innerColor: Colors.teal,
                  outerColor: Colors.tealAccent,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(ImageStrings.appbarCupAsset),
                        Expanded(
                          child: AutoSizeText(
                            "YOUR RANK?!",
                            group: group,
                            textAlign: TextAlign.center,
                            minFontSize: 7,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    // child: Image.asset(ImageStrings.appbarCupAsset),
                  ),
                  onPressed: () => Get.to(Interface(true)),
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
