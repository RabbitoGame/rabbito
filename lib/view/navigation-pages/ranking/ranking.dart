import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/widgets/loading.dart';

Widget rankingMenu(BuildContext context) {
  final List<RankingRow> items = <RankingRow>[
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: ImageStrings.rankingLeagueCrystal1Asset,
        carrot: 13,
        xp: 102),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: ImageStrings.rankingLeagueCrystal2Asset,
        carrot: 13,
        xp: 102),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: ImageStrings.rankingLeagueCrystal3Asset,
        carrot: 13,
        xp: 102),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: ImageStrings.rankingLeagueBronze1Asset,
        carrot: 13,
        xp: 102),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: 'assets/images/logo.png',
        carrot: 13,
        xp: 102),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png',
        carrot: 1213,
        xp: 102),
  ];

  ExpandableThemeData openableTheme = ExpandableThemeData(
    hasIcon: true,
    tapHeaderToExpand: true,
    iconColor: Colors.black,
    iconSize: 40,
    headerAlignment: ExpandablePanelHeaderAlignment.center,
    iconRotationAngle: 50,
    collapseIcon: Icons.close,
    iconPadding: EdgeInsets.all(10),
  );
  ExpandableThemeData closeTheme = ExpandableThemeData(
    hasIcon: false,
    tapHeaderToExpand: false,
    iconColor: Colors.blue,
    iconSize: 30,
    headerAlignment: ExpandablePanelHeaderAlignment.center,
    iconRotationAngle: 50,
    collapseIcon: Icons.close,
    iconPadding: EdgeInsets.all(10),
  );

  Widget buildList() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RankWatch(),
        ),
        Column(
          children: [
            SizedBox(
              height: 95,
            ),
            ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return RankItem(items[index], index + 1);
              },
            ),
          ],
        ),
      ],
    );
  }

  ExpandablePanel openableLeague(String url, String name) {
    return ExpandablePanel(
      theme: openableTheme,
      header: Container(
        // color: Colors.red,

        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Row(
          children: [
            Container(
              child: Image.asset(url, width: 80.0),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Railway',
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
      collapsed: SizedBox(),
      expanded: Container(
        color: Colors.white,
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 3)),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return buildList();
            } else {
              return Container(
                  height: 150, child: Center(child: LoadingWidget()));
            }
          },
        ),
      ),
    );
  }

  Container closeLeague(String url, String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Row(
        children: [
          Container(
            child: Image.asset(url, width: 80.0),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Railway',
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }

  return ListView(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.brown,
            Colors.brown.shade300,
          ], stops: [
            0.6,
            1
          ]),
        ),
        child: openableLeague(
            ImageStrings.rankingLeagueCrystal1Asset, "GEM League"),
      ),
      Container(

        color: Colors.black,
        child: closeLeague(
            ImageStrings.rankingLeagueBronze2Asset, 'DIAMOND League'),
      ),
      closeLeague(ImageStrings.rankingLeagueBronze3Asset, 'DIAMOND League'),
      closeLeague(ImageStrings.rankingLeagueBronze4Asset, 'DIAMOND League'),
      closeLeague(ImageStrings.rankingLeagueBronze5Asset, 'DIAMOND League'),
      closeLeague('assets/images/leagues/platinum.png', 'PLATINUM League'),
      closeLeague('assets/images/leagues/gold.png', 'GOLD League'),
      closeLeague('assets/images/leagues/silver.png', 'SILVER League'),
      closeLeague('assets/images/leagues/bronze.png', 'BRONZE League'),
      closeLeague('assets/images/leagues/copper.png', 'COPPER League'),
      closeLeague('assets/images/leagues/iron.png', 'IRON League'),
    ],
  );
}

class RankingRow {
  late String name;
  late League rank;
  late int cups;
  late String image;
  late int carrot;
  late int xp;

  RankingRow(
      {required this.name,
      required this.rank,
      required this.cups,
      required this.image,
      required this.carrot,
      required this.xp});
}

enum League { Gem, Diamond, Platinum, Gold, Silver, Bronze, Copper, Iron }
