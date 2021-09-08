import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

import 'achievement_progress_bar.dart';

class UserAchievements extends StatelessWidget {
  final list = [0, 1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        // color: Colors.lightGreen.withOpacity(0.3),
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),

        elevation: 10,
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
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 15,
              ),
              child: Container(
                color: Colors.lightGreen,
                child: ListView.builder(
                  itemCount: 50,
                  itemExtent: 100,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
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
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget achievementTile(String leading, String title, String subTitle,
      String asset, String assetString) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Image.asset(
            leading,
            width: 60,
            height: 60,
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(subTitle),
                AchievementProgressBar(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: CustomContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  asset,
                  width: 30,
                ),
                Text(assetString)
              ],
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
