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

Widget gameMenu(BuildContext context) {
  xpProgressBar() {
    return Row(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                top: 8,
                left: 20,
                child: Container(
                  width: 120,
                  height: 25,
                  child: LiquidLinearProgressIndicator(
                    value: 0.5,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    // Defaults to the current Theme's accentColor.
                    center: Text(
                      '30/100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontFamily: 'Railway',
                        fontSize: 16.0,
                      ),
                    ),
                    borderColor: Colors.blue,
                    borderWidth: 2.0,
                    borderRadius: 12.0,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image(
                    image: AssetImage(ImageStrings.appbarStarAsset),
                    width: 45,
                  ),
                  Positioned(
                    top: 15,
                    left: 12,
                    child: Text(
                      "12",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(ImageStrings.rankingCarrotAsset),
                width: 35,
              ),
              Container(
                child: Center(
                  child: Text(
                    '45',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontFamily: 'Railway',
                      fontSize: 16.0,
                    ),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
              )
            ],
          ),
        ),
      ],
    );
  }

  return Column(
    children: [
      Container(
        height: 50.0,
        color: Colors.blue.shade100,
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: xpProgressBar(),
      ),
      Container(
        color: const Color(0xfff0f8ff),
        // color: Colors.orange,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              width: double.maxFinite,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(ImageStrings.logoAsset, width: 200.0),
                  ),
                  Positioned(
                    left: 10,
                    child: TopRowIconButton(() {}, Icons.share),
                  ),
                  Positioned(
                    right: 10,
                    child: TopRowIconButton(() {}, Icons.settings),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(20),
                          primary: const Color(0xff6383F7),
                        ),
                        child: Text(
                          "General League Game",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20),
                            primary: const Color(0xffB06BF7),
                          ),
                          child: Text(
                            "Thematic Game",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
