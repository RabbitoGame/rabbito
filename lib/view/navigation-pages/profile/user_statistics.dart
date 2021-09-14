import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class UserStatistics extends StatelessWidget {
  const UserStatistics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          xpWidget(),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(

                        gradient: RadialGradient(
                          colors: [Colors.white, Colors.orangeAccent],
                          radius: 2,
                          center: Alignment.centerLeft,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(8),
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
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Colors.white, Colors.orangeAccent],
                        radius: 1.5,
                        center: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SmallRow(),
                        SmallRow(),
                        SmallRow(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  xpWidget() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          padding: EdgeInsets.only(left: 20),
          height: 40,
          child: LiquidLinearProgressIndicator(
            value: 0.5,
            valueColor: AlwaysStoppedAnimation(Colors.purple),
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

            borderColor: Colors.deepPurple,
            borderWidth: 2.0,
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
              "12",
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

  SmallRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          ImageStrings.gameHomeCarrot1sAsset,
          width: 25,
        ),
        Text("salam")
      ],
    );
  }
}
