import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class MyFortuneWheel extends StatelessWidget {
  StreamController<int> controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return FortuneWheel(
      selected: controller.stream,
      items: [
        FortuneItem(child: Text('Han Solo')),
        FortuneItem(child: Text('Yoda')),
        FortuneItem(child: Text('Obi-Wan Kenobi')),
      ],
    );
  }
}
