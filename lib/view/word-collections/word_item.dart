import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class WordItem extends StatelessWidget {
  var userState;
  int index;

  WordItem(this.userState, this.index);

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return ClipPath(
        child: watch(40 , "121","dgfjg"),
        clipper: MyCustomClipper(),
      );
    } else {
      return watch(0, "121","dgfjg");
    }
  }

  Widget watch(double topPadding , String word1 , String word2) {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(word1),
            Text(word2),
          ],
        ),
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
