import 'package:flutter/material.dart';

class RankWatch extends StatelessWidget {
  const RankWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        padding: EdgeInsets.fromLTRB(10,5,10,50),
        color: Colors.white.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Expanded(child: Icon(Icons.lock_clock, color: Colors.amber,,),),
            Expanded(
              flex: 2,
              child: Image.asset(
                'assets/images/ranking/clock.png',
                height: 70,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Time Left:",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "6 Days",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "you are",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "18",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      "th",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
              flex: 5,
            )
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
    path.lineTo(0, size.height-10);
    var firstStart = Offset(size.width/5,size.height);
    var firstEnd = Offset(size.width/2.25,size.height-20);
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - size.width/3.25,size.height-50);

    var secondEnd = Offset(size.width,size.height-10);
    path.quadraticBezierTo(secondStart.dx,secondStart.dy,secondEnd.dx,secondEnd.dy);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}