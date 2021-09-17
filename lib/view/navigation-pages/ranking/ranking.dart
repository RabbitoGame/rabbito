import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/widgets/loading.dart';

class RankingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

    Widget buildList() {
      return Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        // padding: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 8),
              child: RankWatch(),
            ),
            Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return RankItem(items[index], index + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget myCard({required Widget widget}) {
      return GlowContainer(
        margin: EdgeInsets.all(10),
        borderRadius: BorderRadius.circular(30),
        glowColor: Colors.brown,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Colors.brown,
                Colors.brown.shade300,
              ], stops: [
                0.6,
                1
              ]),
            ),
            child: widget),
      );
    }

    Widget openableLeague(String url, String name) {
      return myCard(
        widget: ExpandablePanel(
          theme: openableTheme,
          header: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Container(
                  child: Image.asset(url, width: 100.0),
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
          expanded: FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return buildList();
              } else {
                return Container(
                    height: 150, child: Center(child: LoadingWidget(Indicator.ballPulse)));
              }
            },
          ),
        ),
      );
    }

    Widget closeLeague(String url, String name) {
      return myCard(
        widget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                child: Image.asset(url, width: 100.0),
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
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.purple,
        title: Text("ranking"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            openableLeague(
                ImageStrings.rankingLeagueCrystal1Asset, "GEM League"),
            closeLeague(
                ImageStrings.rankingLeagueBronze2Asset, 'DIAMOND League'),
            closeLeague(
                ImageStrings.rankingLeagueBronze3Asset, 'DIAMOND League'),
            closeLeague(
                ImageStrings.rankingLeagueBronze4Asset, 'DIAMOND League'),
            closeLeague(
                ImageStrings.rankingLeagueBronze5Asset, 'DIAMOND League'),
            closeLeague(
                'assets/images/leagues/platinum.png', 'PLATINUM League'),
            closeLeague('assets/images/leagues/gold.png', 'GOLD League'),
            closeLeague('assets/images/leagues/silver.png', 'SILVER League'),
            closeLeague('assets/images/leagues/bronze.png', 'BRONZE League'),
            closeLeague('assets/images/leagues/copper.png', 'COPPER League'),
            closeLeague('assets/images/leagues/iron.png', 'IRON League'),
          ],
        ),
      ),
    );
  }
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
