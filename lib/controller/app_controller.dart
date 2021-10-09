

import '../model/user.dart';
import 'package:get/get.dart';


class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> _firstEntrance = true.obs;
  Rx<bool> _loginScreenStatus = false.obs;
  // Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;
  Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;

  Rx<Status> get loggedInStatus => _loggedInStatus;
  Rx<Status> _registeredInStatus = Status.NotRegistered.obs;
  Rx<Status> get registeredInStatus => _registeredInStatus;
  User? currUser;


  set loggedInStatus(Rx<Status> value) {
    _loggedInStatus = value;
  }

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


  Rx<bool> get loginScreenStatus => _loginScreenStatus;

  set loginScreenStatus(Rx<bool> value) {
    _loginScreenStatus = value;
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

  static bool isLoginScreen() {
    return appController._loginScreenStatus.value;
  }

  set registeredInStatus(Rx<Status> value) {
    _registeredInStatus = value;
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
