import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rabbito/view/init/init.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

Future<void> main() async {
  await GetStorage.init();
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
