import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget gameMenu(BuildContext context) {

  return SizedBox(
      height: MediaQuery.of(context).size.height - 100,
      child: Container(
        color: const Color(0xfff0f8ff),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(0, 100, 0, 0)),
              Image.asset('assets/images/logo.png', width: 200.0),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
                  child: RaisedButton(
                    child: Center(
                        child: Text(
                          "General League Game",
                          style: GoogleFonts.manrope(fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                    ),
                    onPressed: () {},
                    color: const Color(0xff6383F7),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                    splashColor: Colors.grey,
                  )
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: RaisedButton(
                    child: Center(
                        child: Text(
                          "Thematic Game",
                          style: GoogleFonts.manrope(fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                    ),
                    onPressed: () {},
                    color: const Color(0xffB06BF7),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(100, 25, 100, 25),
                    splashColor: Colors.grey,
                  )
              ),
            ],
          )
      )
  );
}