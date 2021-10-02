import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class RankItem extends StatelessWidget {
  var userState;
  int index;
  bool isRanking;
  AutoSizeGroup itemGroup;

  RankItem(this.userState, this.index, this.isRanking, this.itemGroup);

  @override
  Widget build(BuildContext context) {
    if (index == 1 && isRanking) {
      return ClipPath(
        child: item(40),
        clipper: MyCustomClipper(),
      );
    } else {
      return item(0);
    }
  }

  Widget item(double topPadding) {
    if (isRanking) {
      return rankingItem(topPadding);
    } else {
      return wordItem();
    }
  }

  rankingItem(double topPadding) {
    return Container(
      // padding: EdgeInsets.only(top: topPadding),
      padding: EdgeInsets.fromLTRB(10, 10 + topPadding, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),

      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    // width: 30,
                    padding: EdgeInsets.all(5),
                    // constraints: BoxConstraints(minHeight: 25 , maxHeight: SizeConfig.blockSizeVertical*5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    // padding:EdgeInsets.all(4) ,
                    child: Center(
                      child: AutoSizeText(
                        index.toString(),
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(ImageStrings.profileXpAsset, width: 40.0),
                      Text(
                        userState["xp"].toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    child: Image.asset(userState["image"]),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                  flex: 3,
                  child: AutoSizeText(
                    userState["name"],
                    maxLines: 1,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // constraints: BoxConstraints.loose(ُ),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        userState["carrot"].toString(),
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        minFontSize: 8,
                      ),
                      Image.asset(
                        ImageStrings.rankingCarrotAsset,
                        width: SizeConfig.blockSizeHorizontal * 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget wordItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                userState["word"],
                maxLines: 1,
                group: itemGroup,
                maxFontSize: 12,
                minFontSize: 7,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                userState["translation"],
                maxLines: 1,
                group: itemGroup,
                maxFontSize: 12,
                minFontSize: 7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 30);
    var firstStart = Offset(size.width / 5, 40);
    var firstEnd = Offset(size.width / 2.25, 20);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - size.width / 3.25, -10);

    var secondEnd = Offset(size.width, 30);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
