import '../model/user.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> isLoggedIn = false.obs;
  Rx<bool> _firstEntrance = true.obs;

  // final player = AudioPlayer();
  User? currUser;

  @override
  void onInit() async {
    await prefsOnInit();
    // await setMusic();
    super.onInit();
  }

  Rx<bool> get firstEntrance => _firstEntrance;

  set firstEntrance(Rx<bool> value) {
    _firstEntrance = value;
  }

  prefsOnInit() async {
    print('AppController::prefsOnInit');
    // await getUserFromPrefs();
    // await getMusicVolumePrefs();
    update();
  }
}
