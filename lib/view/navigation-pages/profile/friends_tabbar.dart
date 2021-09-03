import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:rabbito/global/strings/image_strings.dart';

class FriendsTabBar extends StatelessWidget {
  const FriendsTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    textStyle() {
      return TextStyle(color: Colors.blue, fontSize: 20.0);
    }

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "Friends!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: new LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.02, 0.02],
                          colors: [Colors.grey, Colors.white],
                        ),
                      ),
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Tab(
                            child: Text(
                              "followers",
                              style: textStyle(),
                            ),
                          ),
                          Tab(
                            child: Text(
                              "following",
                              style: textStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageStrings.profileManAsset),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "no follower yet",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImageStrings.profileWomanAsset),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "no following yet",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
