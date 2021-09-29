import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({Key? key}) : super(key: key);
  final double dividerHeight =5;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    // AutoSizeGroup group = AutoSizeGroup();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          xpWidget(
              xpLevel: 12,
              part: 10,
              all: 20,
              big: SizeConfig.screenWidth > 300),
          SizedBox(
            height: 5,
          ),
          Container(
            height: SizeConfig.screenHeight > 500
                ? SizeConfig.screenHeight *(1/4)
                : SizeConfig.screenHeight *(1/3),
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
                          child: Image.asset(
                            ImageStrings.rankingLeagueBronze2Asset,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "rank 18th",
                              textAlign: TextAlign.center,
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
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallRow(
                        title: "correct matches",
                        number: "3521",
                        width: SizeConfig.screenWidth,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "wrong matches",
                        number: "234",
                        width: SizeConfig.screenWidth,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "victory",
                        number: "53",
                        width: SizeConfig.screenWidth,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "vic ratio",
                        number: "53%",
                        width: SizeConfig.screenWidth,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 0.5,
                        height: dividerHeight,
                      ),
                      SmallRow(
                        title: "wrong",
                        number: "53",
                        width: SizeConfig.screenWidth,
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

  SmallRow({required String title, required String number, width}) {
    TextStyle style =
        TextStyle(color: Colors.white, fontSize: width > 300 ? 13 : 11);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
          maxLines: 1,
        ),
        Text(
          number,
          maxLines: 1,
          style: style,
        )
      ],
    );
  }
}

xpWidget({
  required double xpLevel,
  required double part,
  required double all,
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
