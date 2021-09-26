import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          xpWidget(
            xpLevel: 12,
            part: 10,
            all: 20
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            ImageStrings.rankingLeagueBronze2Asset,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "rank\n18th",
                            textAlign: TextAlign.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallRow(
                        title: "correct matches",
                        number: "3521",
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SmallRow(
                        title: "wrong matches",
                        number: "234",
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SmallRow(
                        title: "dfsd",
                        number: "53",
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

  SmallRow({required String title, required String number}) {
    TextStyle style = TextStyle(color: Colors.white, fontSize: 13);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style,
        ),
        Text(
          number,
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
}) {
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Container(
        padding: EdgeInsets.only(left: 20),
        height: 40,
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
              fontSize: 16.0,
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
            width: 45,
          ),
          Text(
            xpLevel == 0 ? UserStrings.emptyInfo : xpLevel.toString(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ],
  );
}
