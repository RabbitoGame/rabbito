import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/login/login.dart';
import 'package:rabbito/view/login/login_manager.dart';
import 'package:rabbito/view/login/register.dart';
import 'package:rabbito/view/navigation-pages/profile/profile.dart';
import 'package:rabbito/view/navigation-pages/shop/shop.dart';

import '../game-page/gamehome.dart';
import 'appbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    List<Widget> _menus = <Widget>[
      shopMenu(context),
      gameMenu(context),
      LoginManager(),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            FutureAppBar(),
            Expanded(
                child: Container(
              child: _menus[_currentIndex],
            ))
          ],
        ),
      ),
      bottomNavigationBar: _buildOriginDesign(context),
    );
  }

  Widget _buildOriginDesign(context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight > 500 ? 60 : 45,
      child: CustomNavigationBar(
        elevation: 0,
        // borderRadius: Radius.elliptical(30,20),
        iconSize: SizeConfig.screenHeight > 500 ? 60.0 : 40,
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
              top: SizeConfig.screenHeight > 500 ? -20 : -25,
              left: SizeConfig.screenHeight > 500 ? 0 : -4,
              child: Image.asset(
                image,
                width: SizeConfig.screenHeight > 500 ? 50 : 40,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                    fontSize: SizeConfig.screenHeight > 500 ? 16 : 10,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
      icon: Center(
          child: Image.asset(
        image,
        width: SizeConfig.screenHeight > 500 ? 40 : 35,
      )),
    );
  }
}
