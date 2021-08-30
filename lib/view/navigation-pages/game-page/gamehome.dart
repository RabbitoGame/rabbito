import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rabbito/global/localization_service.dart';
import 'package:rabbito/view/navigation-pages/game-page/chest.dart';

Widget gameMenu(BuildContext context) {
  return Container(
      color: const Color(0xfff0f8ff),
      // color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.receipt,
                  color: Colors.teal,
                  size: 50,
                ),
                Icon(
                  Icons.settings_applications,
                  color: Colors.teal,
                  size: 50,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset('assets/images/logo.png', width: 200.0),
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
                      )),
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
          Row(
            children: [
              Expanded(child: Chest()),
              Expanded(child: Chest()),
              Expanded(child: Chest()),
              Expanded(child: Chest()),
            ],
          )
        ],
      ));
}
