import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Color innerColor;

  Color outerColor;
  double x;
  double y;

  double minHeight;
  var onPressed;
  Widget child;

  CustomContainer({
    required this.child,
    required this.onPressed,

    this.innerColor = Colors.lightBlueAccent,
    this.outerColor = Colors.blue,
    this.x = 20,
    this.y = 5,
    this.minHeight = 60,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(x, 0),
      child: Container(

        constraints: BoxConstraints(minHeight: minHeight),
        color: outerColor,
        child: ClipPath(
          clipper: MyCustomClipper(x, y),
          child: Material(
            color: innerColor,
            child: InkWell(
              onTap: onPressed,
              splashColor: Colors.white,
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  double x;
  double y;

  MyCustomClipper(this.x, this.y);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - x - y);
    var firstStart = Offset(0, size.height - y);
    var firstEnd = Offset(x, size.height - y);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    path.lineTo(size.width - x, size.height - y);
    var secondStart = Offset(size.width - y, size.height - y);

    var secondEnd = Offset(size.width - y, size.height - x - y);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width - y, x);
    var thirdStart = Offset(size.width - y, 0);

    var thirdEnd = Offset(size.width - x - y, 0);
    path.quadraticBezierTo(
        thirdStart.dx, thirdStart.dy, thirdEnd.dx, thirdEnd.dy);

    path.lineTo(x, 0);
    var fourthStart = Offset(0, 0);

    var fourthEnd = Offset(0, x);
    path.quadraticBezierTo(
        fourthStart.dx, fourthStart.dy, fourthEnd.dx, fourthEnd.dy);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
