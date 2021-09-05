import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/profile/profile.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';
import 'package:rabbito/view/navigation-pages/shop/shop.dart';

import 'game-page/gamehome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  List<int> _badgeCounts = List<int>.generate(4, (index) => index);

  List<bool> _badgeShows = List<bool>.generate(4, (index) => true);

  @override
  Widget build(BuildContext context) {
    List<Widget> _menus = <Widget>[
      shopMenu(context),
      gameMenu(context),
      profileMenu(context),
      rankingMenu(context),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
                height: 60.0,
                color: Colors.purple,
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 4.0, 10.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      xpProgressBar(),
                      SizedBox(
                        width: 5,
                      ),
                      barIcons(),
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                child: _menus[_currentIndex],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildOriginDesign(),
    );
  }

  Widget _buildOriginDesign() {
    return CustomNavigationBar(
      iconSize: 35.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Color(0xff6c788a),
      backgroundColor: Colors.blue,
      // backgroundColor: Colors.transparent,
      //Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/navigation/shop.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/navigation/game.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/navigation/user.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/navigation/ranking.png'),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget barIcons() {
    double width = 30;
    return Expanded(
      flex: 3,
      child: Row(
        children: [

          Expanded(
            child: Row(children: [
              Image(
                image: AssetImage(ImageStrings.rankingCarrotAsset),
                width: width,
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
            ]),
          ),
          Expanded(
            child: Row(children: [
              Image(
                image: AssetImage('./assets/images/appbar/coin.png'),
                width: width,
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
            ]),
          ),
          Expanded(
            child: Row(
              children: [
                Image(
                  image: AssetImage('./assets/images/appbar/heart.png'),
                  width: width,
                ),
                Container(
                  child: Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                        fontFamily: 'Railway',
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  xpProgressBar() {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image(

              image: AssetImage(ImageStrings.appbarFlagAsset),
              width: 45,
            ),
          ),
          Expanded(
            flex: 3,
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
                Positioned(
                  top:-5,
                  child: Stack(
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
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Row(
//   children: [
//     Image(
//       image: AssetImage('./assets/images/logo.png'),
//     ),
//     Container(
//       child: Center(
//         child: Text(
//           'Rabbito',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.lightGreen,
//             fontFamily: 'Railway',
//             fontSize: 20.0,
//           ),
//         ),
//       ),
//       padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//     )
//   ],
// ),
