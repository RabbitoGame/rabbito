import 'dart:async';
import 'dart:math';

// import 'package:just_audio/just_audio.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/gif_strings.dart';
import 'package:rabbito/model/user_preferences.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:tapsell_plus/tapsell_plus.dart';

import '../model/user.dart';
import 'package:get/get.dart';

const int globalHeartTimerLong = 60;
const int globalHeartTimerChecker = 5;

class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> _firstEntrance = true.obs;
  Rx<bool> _loginScreenStatus = false.obs;
  Rx<bool> _gifTimerIsFirst = true.obs;
  Rx<bool> hasTicketForWheel = true.obs;
  Rx<Timer> globalHeartTimer =
      Timer
          .periodic(Duration(seconds: globalHeartTimerChecker), (timer) {})
          .obs;
  late DateTime ticketDate = DateTime.now();
  late Random _random;

  Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;
  Rx<GifStatus> _gifStatus = GifStatus.Gif1.obs;

  late AudioPlayer menuMusicAudioPlayer;

  late AudioCache menuMusicAudioCache;
  late AudioPlayer effectsAudioPlayer;
  late double musicVolume = 0.5;
  late double soundEffectsVolume = 0.5;
  late AudioCache effectsAudioCache;
  RxBool isAdReady = false.obs;
  Widget? bannerAdWidget;

  Size? size;

  Rx<Status> get loggedInStatus => _loggedInStatus;
  Rx<Status> _registeredInStatus = Status.NotRegistered.obs;

  Rx<Status> get registeredInStatus => _registeredInStatus;
  Rx<Timer> _timer = Timer
      .periodic(Duration(seconds: 1), (x) {})
      .obs;

  Rx<User>? currUser = User(
    xp: 0,
    refreshToken: '',
    coin: null,
    id: null,
    hearts: null,
    username: '',
    xpLevel: null,
    carrot: null,
  ).obs;

  Rx<GifStatus> get gifStatus => _gifStatus;

  set gifStatus(Rx<GifStatus> value) {
    _gifStatus = value;
  }

  set loggedInStatus(Rx<Status> value) {
    _loggedInStatus = value;
  }

  @override
  void onInit() async {
    AppController.appController.loggedInStatus.value =Status.LoggedIn;
    initiateHeartTimer();
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

  static bool isLoggedIn() {
    return appController._loggedInStatus.value == Status.LoggedIn;
  }

  static int getXp() {
    return AppController.appController.currUser!.value.xp!;
  }

  static int getXpLevel() {
    return AppController.appController.currUser!.value.xpLevel! + 1;
  }

  static int getCoin() {
    return AppController.appController.currUser!.value.coin!;
  }

  static int getHeart() {
    return AppController.appController.currUser!.value.hearts!;
  }

  static int getCarrot() {
    return AppController.appController.currUser!.value.carrot!;
  }

  static int getXpMax() {
    return 1000;
  }

  static getUsername() {
    return AppController.appController.currUser!.value.username!;
  }

  static getDate() {
    return "date";
  }

  static getLanguage() {
    return "Learning English";
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
      if (_gifTimerIsFirst.value) {
        _gifStatus.value = GifStatus.Gif1;
        _gifTimerIsFirst.value = false;
      } else {
        if (_random.nextBool()) {
          _gifStatus.value = GifStatus.Gif2;
        } else {
          _gifStatus.value = GifStatus.Image;
        }
      }
    });
  }

  setMusic() async {
    menuMusicAudioPlayer = AudioPlayer();
    effectsAudioPlayer = AudioPlayer();
    menuMusicAudioCache = AudioCache(
      prefix: 'assets/sounds/',
      fixedPlayer: menuMusicAudioPlayer,
    );
    await menuMusicAudioCache!.loop('MenuMusic.mp3');
    UserPreferences.readMusic();
  }

  void initiateHeartTimer() {
    globalHeartTimer.value.cancel();
    globalHeartTimer.value = Timer.periodic(
      Duration(seconds: globalHeartTimerChecker),
          (timer) {
        if (AppController.isLoggedIn()) {
          DateTime time = AppController.appController.currUser!.value
              .heartTime!;
          // var minutes = DateTime.now().difference(time).inMinutes;
          var minutes = DateTime.now().difference(time).inSeconds;
          var maghsom = minutes ~/ globalHeartTimerLong;
          var baghimandeh = minutes % globalHeartTimerLong;
          // DateTime.now().
          if(maghsom >0){
            AppController.appController.currUser!.update((val) {
              val!.heartTime =  DateTime.now().subtract(Duration(minutes: baghimandeh));
            });

          }
          User.addHeart(maghsom);


        }
      },
    );
  }

  void initiateBannerAd() {
    final zoneId = "616e850690f1c157757c541c";
    TapsellPlus.instance.requestNativeAd(zoneId).then((responseId) {
      TapsellPlus.instance.showNativeAd(responseId, onOpened: (nativeAd) {
        bannerAdWidget = Container(
          color: Colors.white.withOpacity(0.5),
          width: double.maxFinite,
          padding: EdgeInsets.all(SizeConfig.padding1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.network(
                  nativeAd.iconUrl!,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        nativeAd.title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        nativeAd.description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(SizeConfig.padding1),
                  child: CustomContainer(
                    innerColor: Colors.red,
                    outerColor: Colors.redAccent,
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.padding1),
                      child: FittedBox(
                        child: Text(
                          nativeAd.callToActionText!,
                          textDirection: TextDirection.rtl,

                          style: TextStyle(color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,),
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    onPressed: () {
                      TapsellPlus.instance.nativeBannerAdClicked(responseId);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
        print("what???");
        AppController.appController.isAdReady.value = true;
        print("ad done");
      }, onError: (errorPayload) {
        print("errorr ad");
      });
    }).catchError((error) {
      Get.snackbar("error", "error in ad opening");
    });
  }

  void initiateStandardBannerAd() {
    var zoneId = "616fd4c3eedd084fd3e09fda";
    TapsellPlus.instance
        .requestStandardBannerAd(zoneId, TapsellPlusBannerType.BANNER_320x50)
        .then(
          (responseId) {
        TapsellPlus.instance.showStandardBannerAd(
          responseId,
          TapsellPlusHorizontalGravity.BOTTOM,
          TapsellPlusVerticalGravity.CENTER,
          margin: EdgeInsets.only(
            bottom: SizeConfig.screenHeight > 500 ? 180 : 135,
          ),
          onOpened: (map) {
            AppController.appController.isAdReady.value = true;

            print('Ad opened - Data: $map');
          },
          onError: (map) {
            print('Ad opened - Data: $map');
          },
        );
      },
    ).catchError(
          (error) {
        // Error when requesting for an ad
      },
    );
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
enum GifStatus {
  Gif1,
  Gif2,
  Image,
}
