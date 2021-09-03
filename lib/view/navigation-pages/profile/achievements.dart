import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class UserAchievements extends StatelessWidget {
  final list = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: -30,
              left: 71,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightGreen.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageStrings.profileAchievementAsset,
                      width: 40,
                    ),
                    Text(
                      "Achievements",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Image.asset(
                      ImageStrings.profileAchievementAsset,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: ListView(
                // shrinkWrap: true,
                children: list
                    .map(
                      (e) => Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0.02, 0.02],
                            colors: [Colors.grey, Colors.white],
                          ),
                        ),
                        child: achievementTile(
                          ImageStrings.leagueBronzeAsset,
                          "gods mod",
                          "reach 5 ",
                          ImageStrings.appbarHeartAsset,
                          "5",
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  ListTile achievementTile(String leading, String title, String subTitle,
      String asset, String assetString) {
    return ListTile(
      leading: Image.asset(
        leading,
        width: 30,
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subTitle),
          SizedBox(
            height: 4,
          ),
          LinearPercentIndicator(
            width: 140.0,
            lineHeight: 14.0,
            percent: 0.7,
            linearGradientBackgroundColor: LinearGradient(
              colors: [
                Colors.yellowAccent,
                Colors.white,
              ],
            ),
          ),
        ],
      ),
      trailing: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Image.asset(
              asset,
              width: 30,
            ),
            Text(assetString)
          ],
        ),
      ),
    );
  }
}
