import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/profile/profile.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';
import 'package:rabbito/view/navigation-pages/shop/shop.dart';
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
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    flagAndName(),
                    SizedBox(
                      width: 5,
                    ),
                    barIcons(),
                  ],
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
    double width = 33;
    return Expanded(
      flex: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(children: [
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage(ImageStrings.rankingCarrotAsset,),
                width: 30,
              ),
              Container(
                child: Center(
                  child: Text(
                    '4235',
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
          Row(
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
        ],
      ),
    );
  }

  flagAndName() {
    return Expanded(
      flex: 6,
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: AssetImage(ImageStrings.appbarFlagAsset),
              width: 45,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Image(
                  image: AssetImage('./assets/images/logo.png'),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'Rabbito',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.lightGreen,
                        fontFamily: 'Railway',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
