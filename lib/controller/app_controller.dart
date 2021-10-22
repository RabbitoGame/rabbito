

import 'dart:async';
import 'dart:math';

// import 'package:just_audio/just_audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:rabbito/global/strings/gif_strings.dart';
import 'package:rabbito/model/user_preferences.dart';

import '../model/user.dart';
import 'package:get/get.dart';



class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> _firstEntrance = true.obs;
  Rx<bool> _loginScreenStatus = false.obs;
  Rx<bool> _timerIsFirst = true.obs;
  late Random _random ;
  Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;
  Rx<GifStatus> _gifStatus = GifStatus.Gif1.obs;

  late AudioPlayer menuMusicAudioPlayer;

  late AudioCache menuMusicAudioCache;
  late AudioPlayer effectsAudioPlayer;
  late double musicVolume=0.5;
  late double soundEffectsVolume=0.5;
  late AudioCache effectsAudioCache;
  Rx<Status> get loggedInStatus => _loggedInStatus;
  Rx<Status> _registeredInStatus = Status.NotRegistered.obs;
  Rx<Status> get registeredInStatus => _registeredInStatus;
  Rx<Timer>  _timer = Timer.periodic(Duration(seconds: 1),(x){}).obs;

  User? currUser;


  Rx<GifStatus> get gifStatus => _gifStatus;

  set gifStatus(Rx<GifStatus> value) {
    _gifStatus = value;
  }

  set loggedInStatus(Rx<Status> value) {
    _loggedInStatus = value;
  }

  @override
  void onInit() async {

    initiateGamePageGifTimer();
    await prefsOnInit();
    await setMusic();
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

  void initiateGamePageGifTimer() {
    _random = Random();
    _timer.value = Timer.periodic(Duration(seconds: 3), (timer) {
      if(_timerIsFirst.value) {
        _gifStatus.value = GifStatus.Gif1;
        _timerIsFirst.value = false;
      }else{
        if(_random.nextBool()){
          _gifStatus.value = GifStatus.Gif2;
        }else{
          _gifStatus.value = GifStatus.Image;
        }
      }
    });
  }

  setMusic() async{

    menuMusicAudioPlayer = AudioPlayer();
    effectsAudioPlayer = AudioPlayer();
    menuMusicAudioCache = AudioCache(
      prefix: 'assets/sounds/',
      fixedPlayer: menuMusicAudioPlayer,
    );
    // await menuMusicAudioCache!.loop('MenuMusic.mp3');
    // UserPreferences.readMusic();




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
enum GifStatus{
  Gif1,
  Gif2,
  Image,
}
