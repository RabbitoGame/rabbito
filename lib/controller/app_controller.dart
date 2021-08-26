import '../model/user.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  Rx<bool> isLoggedIn =false.obs;
  // final player = AudioPlayer();
  User? currUser;
  @override
  void onInit() async{
    await prefsOnInit();
    // await setMusic();
    super.onInit();
  }
  prefsOnInit() async {
    print('AppController::prefsOnInit');
    // await getUserFromPrefs();
    // await getMusicVolumePrefs();
    update();
  }


}