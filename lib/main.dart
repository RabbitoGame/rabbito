import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rabbito/view/init/init.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitPage();
  }
}
