import 'dart:ui';

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
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(ImageStrings.backgroundBack9Asset),
        // colorFilter: ColorFilter.,
        fit: BoxFit.cover,
      ),
    ),
    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: GameAppBar(),
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            width: double.maxFinite,
            child: Center(
              child: Image.asset(ImageStrings.logoAsset),
            ),
          ),
        ),
        Expanded(
          child: Container(),
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
  return Row(
    children: [
      Expanded(
        child: Container(
          width: double.maxFinite,
          margin: EdgeInsets.fromLTRB(10, 0, 5, 10),
          child: CustomContainer(
            child: Text(
              "General League Game",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
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
          margin: EdgeInsets.fromLTRB(5, 0, 10, 10),
          child: CustomContainer(
            child: Text(
              "Thematic Game",
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
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
