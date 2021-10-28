import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:game_widget2/main.dart';
import 'package:game_widget2/models/game.dart';
import 'package:game_widget2/models/user.dart' as game_widget_user_mod;
import 'package:game_widget2/views/game_widget.dart';
import 'package:game_widget2/views/placement_game_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/gif_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/view/login/register.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'package:rabbito/view/widgets/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_page_appbar.dart';

Widget gameMenu(BuildContext context) {
  SizeConfig().init(context);
  AppController.appController.initiateBannerAd();

  var paddings = SizeConfig.screenHeight > 500
      ? EdgeInsets.fromLTRB(SizeConfig.padding3, 0, SizeConfig.padding3, 0)
      : EdgeInsets.fromLTRB(SizeConfig.padding2, 0, SizeConfig.padding2, 0);

  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/wallpapers/MainPageWallpaper.png'),
        // colorFilter: ColorFilter.,
        fit: BoxFit.fill,
      ),
    ),
    child: Column(
      children: [
        Expanded(
          flex: SizeConfig.screenHeight > 500 ? 12 : 16,
          child: Padding(
            padding: SizeConfig.screenHeight > 500
                ? EdgeInsets.fromLTRB(SizeConfig.padding3,
                    SizeConfig.padding3 / 2, SizeConfig.padding3, 0)
                : EdgeInsets.fromLTRB(SizeConfig.padding2,
                    SizeConfig.padding2 / 2, SizeConfig.padding2, 0),
            child: GameAppBar(),
          ),
        ),
        Expanded(
          flex: 24,
          child: Obx(() {
            String asset = "";
            var x = AppController.appController.gifStatus.value;
            asset = x == GifStatus.Gif1
                ? GifStrings.rabittoStarterGif
                : x == GifStatus.Gif2
                    ? GifStrings.rabittoWavingGif
                    : GifStrings.rabittoLastFrameGif;
            return Image.asset(
              asset,
              // fit: BoxFit.fitWidth,
            );
          }),
        ),
        Expanded(
            flex: 8,
            child: Padding(
              padding: paddings,
              child: playButtons(),
            )),
        Row(children: [
          ElevatedButton(
            onPressed: () {
              User.logOut();
            },
            child: Text("logout"),
          ),
          ElevatedButton(
            child: Text("remove heart"),
            onPressed: () {
              if (AppController.isLoggedIn()) {
                AppController.appController.currUser!.update((val) {
                  var temp = val!.hearts!;
                  val!.hearts = temp - 1;
                });
              }
            },
          ),
        ]),
        Obx(() {
          return Expanded(
            flex: 5,
            child: AppController.appController.isAdReady.value
                ? AppController.appController.bannerAdWidget!
                : LoadingWidget(Indicator.ballBeat),
          );
        }),
      ],
    ),
  );
}

playButtons() {
  AutoSizeGroup group = AutoSizeGroup();
  return Row(
    children: [
      Expanded(
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(10, 0, 2, 10),
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                "General League Game",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                minFontSize: 13,
                group: group,
              ),
            ),
            onPressed: () async {
              final user = AppController.appController.currUser;
              if (user == null ||
                  user.value.refreshToken == null ||
                  user.value.accessToken == null) {
                Get.snackbar(
                  'Login first!!',
                  'You can\'t start playing without an account. Tap to Signup right now!!',
                  isDismissible: true,
                  backgroundColor: Colors.black54,
                  colorText: Colors.white,
                  duration: Duration(seconds: 5),
                  onTap: (_) => Get.to(() => RegisterScreen()),
                );
                return;
              }
              currentUser = game_widget_user_mod.User(
                user.value.username!,
                avatar: user.value.avatar!,
                cardBg: 1,
                refreshToken: user.value.refreshToken!,
                accessToken: user.value.accessToken!,
              );

              // if player hasnt dont placement game before start placement game widget instead
              if (!(await SharedPreferences.getInstance())
                  .containsKey(PlacementGameWidget.keyHasDonePlacement)) {
                Get.snackbar(
                  'Placement first!!',
                  'Looks like you haven\'t played a Placement Game yet. Tap to start one right now!!',
                  isDismissible: true,
                  backgroundColor: Colors.black54,
                  colorText: Colors.white,
                  duration: Duration(seconds: 5),
                  onTap: (_) async {
                    final rankWords = await PlacementGameWidget.getRankWords();
                    Get.off(() => PlacementGameWidget(currentUser, rankWords));
                  },
                );
                return;
              }

              final game = await Game.join(currentUser);
              unawaited(
                  AppController.appController.menuMusicAudioPlayer.pause());
              Get.to(
                () => GameWidget(
                  game,
                  afterGameTodo: () =>
                      AppController.appController.menuMusicAudioPlayer.resume(),
                ),
              );
            },
            // innerColor: const Color(0xff6383F7),
            innerColor: Colors.deepOrangeAccent,
            outerColor: Colors.deepOrange,
          ),
        ),
      ),
      Expanded(
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(2, 0, 10, 10),
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                "Thematic Game",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                minFontSize: 10,
                group: group,
              ),
            ),
            onPressed: () {},
            innerColor: Colors.deepPurpleAccent,
            // outerColor: const Color(0xffB06BF7).withOpacity(0.5),
            outerColor: Colors.deepPurple,
            // innerColor: const Color(0xffB06BF7),
          ),
        ),
      ),
    ],
  );
}
