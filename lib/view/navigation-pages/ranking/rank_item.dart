import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class RankItem extends StatelessWidget {
  var userState;
  int index;
  bool isRanking;

  RankItem(this.userState, this.index, this.isRanking);

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
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
      return wordItem(topPadding);
    }
  }

  rankingItem(double topPadding) {
    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: ListTile(
        // contentPadding: EdgeInsets.all(5),
        horizontalTitleGap: 0,
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(20, 30),
              bottomRight: Radius.elliptical(20, 30),
            ),
            // color: Colors.lightBlueAccent,
            color: Colors.green,
          ),
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
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
                width: 5,
              ),
              CircleAvatar(
                child: Image.asset(userState["image"]),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(userState["name"]),
                flex: 5,
              ),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 50),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 5, right: 10, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              userState["carrot"].toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            ImageStrings.rankingCarrotAsset,
                            width: 35,
                          ),
                          right: -20,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // subtitle: Text(item.cups.toString()),
      ),
    );
  }

  Widget wordItem(double topPadding) {
    if(userState["word"] == null ){
      print("null detected");
    }
    print(userState["word"]);
    print(userState["translation"]);
    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(userState["word"]),
          Text(userState["translation"]),
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
