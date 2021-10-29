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
        child: item(SizeConfig.blockSizeVertical * 10),
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
      padding: EdgeInsets.fromLTRB(
        SizeConfig.padding1,
        SizeConfig.padding1 + topPadding,
        SizeConfig.padding1,
        SizeConfig.padding1,
      ),
      height: SizeConfig.height1 + topPadding,
      constraints: BoxConstraints(maxHeight: 100 + topPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(
            SizeConfig.radius3,
            SizeConfig.radius3 + SizeConfig.radius2,
          ),
          bottomRight: Radius.elliptical(
            SizeConfig.radius3,
            SizeConfig.radius3 + SizeConfig.radius2,
          ),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, SizeConfig.padding1),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
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
                      Align(
                        child: Image.asset(ImageStrings.profileXpAsset),
                        alignment: Alignment.center,
                      ),
                      Align(
                        child: Text(
                          userState["xp_level"].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    child: Image.asset(ImageStrings.logoAsset),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Flexible(
                  flex: 3,
                  child: AutoSizeText(
                    userState["username"],
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
                  padding: EdgeInsets.all(SizeConfig.padding1),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(SizeConfig.radius1),
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
      height: SizeConfig.height1*0.8 ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(
              SizeConfig.radius3, SizeConfig.radius3 + SizeConfig.radius2),
          bottomRight: Radius.elliptical(
              SizeConfig.radius3, SizeConfig.radius3 + SizeConfig.radius2),
        ),
        // color: Colors.white.withOpacity(0.6),
        color: Colors.white.withOpacity(0.7)
      ),
      margin: EdgeInsets.fromLTRB(0, 0, 0, SizeConfig.padding1),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.padding2),
              child: AutoSizeText(
                userState["word"],
                textAlign: TextAlign.center,
                maxLines: 1,
                group: itemGroup,
                maxFontSize: 15,
                minFontSize: 7,
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(SizeConfig.padding1),
            child: Image.asset(ImageStrings.rankingTranslate1Asset),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.padding2),
              child: AutoSizeText(
                userState["translation"],
                maxLines: 1,
                textAlign: TextAlign.center,
                group: itemGroup,
                maxFontSize: 15,
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
