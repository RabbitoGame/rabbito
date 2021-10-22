import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user.dart';

class UserStatistics extends StatelessWidget {
  int win;
  int loose;
  int correctMatches;
  int wrongMatches;
  int league;
  int rank;

  UserStatistics({
    required this.win,
    required this.loose,
    required this.correctMatches,
    required this.wrongMatches,
    required this.rank,
    required this.league,
  });

  final double dividerHeight = 5;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    AutoSizeGroup group = AutoSizeGroup();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          xpWidget(
              all: AppController.isLoggedIn() ? 1000 : 0,
              part: AppController.isLoggedIn() ? AppController.getXp() : 0,
              xpLevel:
                  AppController.isLoggedIn() ? AppController.getXpLevel() : 0,
              big: SizeConfig.screenWidth > 300),
          SizedBox(
            height: 5,
          ),
          Container(
            height: SizeConfig.screenHeight > 500
                ? SizeConfig.screenHeight * (1 / 4)
                : SizeConfig.screenHeight * (1 / 3),
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Image.asset(
                              User.calculateLeagueImageString(league)
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: AutoSizeText(
                              rank.toString() + "th",
                              textAlign: TextAlign.center,
                              minFontSize: 12,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 17,
                                // color: Color(0xffffb300),
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                  width: dividerHeight,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SmallRow(
                        title: "correct matches",
                        number: correctMatches.toString(),
                        width: SizeConfig.screenWidth,
                        group: group,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "wrong matches",
                        number: wrongMatches.toString(),
                        width: SizeConfig.screenWidth,
                        group: group,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "victory",
                        number: win.toString(),
                        width: SizeConfig.screenWidth,
                        group: group,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "vic ratio",
                        number: (win / (win + loose)*100).toString()+"%",
                        width: SizeConfig.screenWidth,
                        group: group,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SmallRow({required String title, required String number, width, group}) {
    TextStyle style =
        TextStyle(color: Colors.white, fontSize: width > 300 ? 13 : 11);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AutoSizeText(
            title,
            style: style,
            maxLines: 1,
            minFontSize: 8,
            group: group,
          ),
          flex: 3,
        ),
        Expanded(
          child: AutoSizeText(
            number,
            maxLines: 1,
            style: style,
            minFontSize: 8,
            textAlign: TextAlign.end,
            group: group,
          ),
        )
      ],
    );
  }

}

xpWidget({
  required int xpLevel,
  required int part,
  required int all,
  required bool big,
}) {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Container(
        padding: EdgeInsets.only(left: 20),
        height: big ? 40 : 30,
        child: LiquidLinearProgressIndicator(
          value: all == 0 ? 0 : part / all,
          valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
          // Defaults to the current Theme's accentColor.
          center: Text(
            all == 0
                ? UserStrings.emptyInfo
                : part.toString() + "/" + all.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
              fontFamily: 'Railway',
              fontSize: big ? 16.0 : 12,
            ),
          ),

          borderColor: Colors.deepPurple.shade100,
          borderWidth: 4.0,
          borderRadius: 12.0,
          backgroundColor: Colors.white,
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage(ImageStrings.profileXpAsset),
            width: big ? 45 : 35,
          ),
          Text(
            xpLevel == 0 ? UserStrings.emptyInfo : xpLevel.toString(),
            style: TextStyle(
              fontSize: big ? 16 : 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ],
  );
}
