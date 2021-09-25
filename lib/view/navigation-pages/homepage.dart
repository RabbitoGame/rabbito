import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/login/register.dart';
import 'package:rabbito/view/navigation-pages/profile/profile.dart';
import 'package:rabbito/view/navigation-pages/shop/shop.dart';

import 'game-page/gamehome.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;

  List<int> _badgeCounts = List<int>.generate(4, (index) => index);

  List<bool> _badgeShows = List<bool>.generate(4, (index) => true);

  @override
  Widget build(BuildContext context) {
    List<Widget> _menus = <Widget>[
      shopMenu(context),
      gameMenu(context),
      AppController.isLoggedIn() ? profileMenu(context) : RegisterScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60.0,
              color: Colors.purple,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 4.0, 10.0),
              child: barIcons(),
            ),
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
    return Container(

      height: 65,
      child: CustomNavigationBar(
        elevation: 0,
        // borderRadius: Radius.elliptical(30,20),
        iconSize: 60.0,
        selectedColor: Colors.white,
        strokeColor: Colors.white,
        // unSelectedColor: Color(0xff6c788a),
        backgroundColor: Colors.deepPurple,
        items: [
          navItem(image: ImageStrings.navigationShopAsset, text: "shop"),
          navItem(image: ImageStrings.navigationGameAsset, text: "game"),
          navItem(image: ImageStrings.navigationUserAsset, text: "profile"),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget barIcons() {
    double width = 33;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(ImageStrings.appbarFlagAsset),
            width: 45,
          ),
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
                image: AssetImage(
                  ImageStrings.rankingCarrotAsset,
                ),
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
      flex: 2,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Image(
          image: AssetImage(ImageStrings.appbarFlagAsset),
          width: 45,
        ),
      ),
    );
  }

  navItem({
    required String image,
    required String text,
  }) {
    return CustomNavigationBarItem(
      selectedIcon: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(10),

        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: -20,
              child: Image.asset(image, width: 50,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      icon: Center(
          child: Image.asset(
        image,
        width: 40,
      )),
    );
  }
}
