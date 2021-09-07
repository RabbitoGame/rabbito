import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/localization_service.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/game-page/chest.dart';
import 'package:rabbito/view/navigation-pages/game-page/top_row_icon_button.dart';
import 'package:rabbito/view/navigation-pages/homepage.dart';
import 'package:rabbito/view/widgets/custom_container.dart';

import 'game_page_appbar.dart';

Widget gameMenu(BuildContext context) {
  return Container(
    color: const Color(0xfff0f8ff),
    child: Column(
      children: [
        Container(
          height: 100.0,
          // color: Colors.blue.shade100,
          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          child: GameAppBar(),
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: double.maxFinite,
            child: Center(
              child: Image.asset(ImageStrings.logoAsset, width: 250.0),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: CustomContainer(
               Text(
                "General League Game",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              innerColor: const Color(0xff6383F7),
              outerColor: const Color(0xff6383F7).withOpacity(0.5),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.maxFinite,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: CustomContainer(
              Text(
                "Thematic Game",
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              innerColor: const Color(0xffB06BF7),
              outerColor: const Color(0xffB06BF7).withOpacity(0.5),
              // innerColor: const Color(0xffB06BF7),
            ),
          ),
        ),
      ],
    ),
  );
}
