

import '../model/user.dart';
import 'package:get/get.dart';


class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> _firstEntrance = true.obs;
  Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;

  Rx<Status> get loggedInStatus => _loggedInStatus;
  Rx<Status> _registeredInStatus = Status.NotRegistered.obs;
  Rx<Status> get registeredInStatus => _registeredInStatus;
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
  static bool isLoggedIn(){
    return appController._loggedInStatus.value == Status.LoggedIn;
  }


}

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}
