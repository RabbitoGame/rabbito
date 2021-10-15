import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class RankWatch extends StatelessWidget {
  final int rank;

  RankWatch(this.rank);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 50),
        color: Colors.white.withOpacity(0.5),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Image.asset(ImageStrings.appbarCupAsset)),
            )),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AutoSizeText.rich(
                      TextSpan(
                        text: "you are",
                        style: TextStyle(fontSize: 16, color: Colors.teal),
                        children: [
                          TextSpan(
                            text: rank.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          TextSpan(
                            text: "th",
                            style: TextStyle(fontSize: 16, color: Colors.teal),
                          )
                        ],
                      ),
                      maxLines: 1,
                      minFontSize: 8,
                    ),
                  ],
                ),
              ),
            ),
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
    path.lineTo(0, size.height - 10);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 20);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - size.width / 3.25, size.height - 50);

    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
