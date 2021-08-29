import 'package:flutter/material.dart';

class RankItem extends StatelessWidget {
  var userState;
  int index;

  RankItem(this.userState, this.index);

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return ClipPath(
        child: watch(40),
        clipper: MyCustomClipper(),
      );
    } else {
      return watch(0);
    }
  }

  Widget watch(double topPadding) {
    return Container(
      padding: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.elliptical(20, 30),
          bottomRight: Radius.elliptical(20, 30),
        ),
        color: const Color(0xff17A0F2).withOpacity(0.2),
      ),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: ListTile(
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.elliptical(20, 30),
                bottomRight: Radius.elliptical(20, 30),
              ),
              color: Colors.lightBlueAccent),
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
                flex: 3,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/ranking/badge.png', width: 45.0),
                    Text(
                      userState.xp.toString(),
                      style: TextStyle(
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(userState.name),
                flex: 6,
              ),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minWidth: 60),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 20, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              userState.carrot.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "assets/images/ranking/carrot2.png",
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
