import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'dart:math';
class AchievementProgressBar extends StatelessWidget {
  Random random = new Random();
  @override
  Widget build(BuildContext context) {

    int randomNumber = random.nextInt(100);
    int totalNumber =random.nextInt(100) +100;
    return Container(
      child: LiquidCustomProgressIndicator(
        direction: Axis.horizontal,
        backgroundColor: Colors.grey[300],
        center: Text("$randomNumber/$totalNumber"),
        value: randomNumber/totalNumber,
        valueColor: AlwaysStoppedAnimation(Colors.red),
        shapePath: _buildSpeechBubblePath(),
      ),
    );
  }

  Path _buildSpeechBubblePath() {
    double x = 10;
    double x2 = -20;
    double y2 = 5;
    double y3 = 25;
    double y4 = 30;
    return Path()
      ..moveTo(0, 10)
      ..quadraticBezierTo(x + 10 + x2, 0, 20 + x2, y2)
      ..quadraticBezierTo(x + 30 + x2, 0, 40 + x2, y2)
      ..quadraticBezierTo(x + 50 + x2, 0, 60 + x2, y2)
      ..quadraticBezierTo(x + 70 + x2, 0, 80 + x2, y2)
      ..quadraticBezierTo(x + 90 + x2, 0, 100 + x2, y2)
      ..quadraticBezierTo(x + 110 + x2, 0, 120 + x2, y2)
      ..quadraticBezierTo(x + 130 + x2, 0, 140 + x2, y2)
      ..quadraticBezierTo(x + 150 + x2, 0, 160 + x2, y2)
      ..quadraticBezierTo(180 + x2, y2 + 10, 160 + x2, y3)
      ..quadraticBezierTo(x + 150 + x2, y4, 140 + x2, y3)
      ..quadraticBezierTo(x + 130 + x2, y4, 120 + x2, y3)
      ..quadraticBezierTo(x + 110 + x2, y4, 100 + x2, y3)
      ..quadraticBezierTo(x + 90 + x2, y4, 80 + x2, y3)
      ..quadraticBezierTo(x + 70 + x2, y4, 60 + x2, y3)
      ..quadraticBezierTo(x + 50 + x2, y4, 40 + x2, y3)
      ..quadraticBezierTo(x + 30 + x2, y4, 20 + x2, y3)
      ..quadraticBezierTo(x + 10+x2 , y4, 0 , y3)
      // ..quadraticBezierTo(x + -20, 30, 0, 10)
      ..close();
  }
}
