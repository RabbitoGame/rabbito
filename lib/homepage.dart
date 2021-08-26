import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/profile.dart';
import 'package:rabbito/ranking.dart';
import 'package:rabbito/shop.dart';

import 'gamehome.dart';

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
    List <Widget> _menus = <Widget>[
      shopMenu(context),
      gameMenu(context),
      profileMenu(context),
      rankingMenu(context),
    ];

    return Scaffold(
      // extendBody for floating bar get better performance
      extendBody: true,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
                height: 60.0,
                color: Colors.purple,
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 4.0, 10.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
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
                        flex: 2,
                      ),
                      Expanded(
                        child: Row(
                            children: [
                              Image(
                                image: AssetImage('./assets/images/coin.png'),
                                width: 30.0,
                              ),
                              Container(
                                child:  Center(
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
                            ]
                        ),
                      ),
                      Expanded(
                        child: Row(
                            children: [
                              Image(
                                image: AssetImage('./assets/images/cup.png'),
                                width: 30.0,
                              ),
                              Container(
                                child:  Center(
                                  child: Text(
                                    '100',
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
                            ]
                        ),
                      ),
                      Expanded(
                        child: Row(
                            children: [
                              Image(
                                image: AssetImage('./assets/images/heart.png'),
                                width: 30.0,
                              ),
                              Container(
                                child:  Center(
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
                            ]
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Container(
              child: _menus[_currentIndex],
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
      backgroundColor: Colors.blue,//Color(0xff040307),
      items: [
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/shop.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/game.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/user.png'),
        ),
        CustomNavigationBarItem(
          icon: Image.asset('assets/images/ranking.png'),
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
}