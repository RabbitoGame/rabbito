import 'package:flutter/material.dart';
import 'package:rabbito/view/init/init.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App());
  final appId = "recfoicijmegdjcomstgqtlsfmhfjjtjdfgrqhmsrphlikrsrmcmsltqtqpbmislijmdis";

  TapsellPlus.instance.initialize(appId);
  TapsellPlus.instance.setGDPRConsent(true);


}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitPage();
  }
}
