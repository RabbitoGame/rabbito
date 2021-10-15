import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/gif_strings.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/widgets/custom_container.dart';
import 'game_page_appbar.dart';

Widget gameMenu(BuildContext context) {
  SizeConfig().init(context);
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/wallpapers/MainPageWallpaper.png'),
        // colorFilter: ColorFilter.,
        fit: BoxFit.fill,
      ),
    ),
    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    child: Column(
      children: [
        Expanded(
          flex: SizeConfig.screenHeight > 500 ? 3 : 4,
          child: GameAppBar(),
        ),
        Expanded(
          flex: 8,
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
              fit: BoxFit.cover,
            );
          }),
        ),
        Expanded(
          flex: 3,
          child: playButtons(),
        ),
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
            onPressed: () {},
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
