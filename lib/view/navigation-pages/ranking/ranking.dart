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
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            topLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
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

    Widget myCard({required Widget widget, required Color color}) {
      return Card(
        // color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 20,

        color: Color(0xff3c2457),
        child: widget,
      );
    }

    Widget openableLeague(String url, String name, bool right) {
      return Padding(
        padding:
            right ? EdgeInsets.only(right: 30.0) : EdgeInsets.only(left: 30.0),
        child: myCard(
          color: Colors.blueAccent,
          widget: ExpandablePanel(
            theme: openableTheme,
            header: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
              child: Row(
                children: [
                  Container(
                    child: Image.asset(url, width: 60.0),
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: buildList(),
                  );
                } else {
                  return Container(
                      height: 150,
                      child: Center(child: LoadingWidget(Indicator.ballPulse)));
                }
              },
            ),
          ),
        ),
      );
    }

    Widget closeLeague(String url, String name, bool right) {
      return Padding(
        padding:
            right ? EdgeInsets.only(right: 30.0) : EdgeInsets.only(left: 30.0),
        child: myCard(
          color: Colors.amber,
          widget: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  child: Image.asset(url, width: 60.0),
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
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff301b49),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xff0d7d7d),
                  // backgroundColor: Colors.green,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(20, 30),
                      bottomRight: Radius.elliptical(20, 30),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Rankings!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    collapseMode: CollapseMode.parallax,
                    background: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          ImageStrings.appbarCupAsset,
                          width: 140,
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: <Widget>[
                  openableLeague(ImageStrings.rankingLeagueCrystal1Asset,
                      "GEM League", true),
                  closeLeague(ImageStrings.rankingLeagueBronze2Asset,
                      'DIAMOND League', false),
                  closeLeague(ImageStrings.rankingLeagueBronze3Asset,
                      'DIAMOND League', true),
                  closeLeague(ImageStrings.rankingLeagueBronze4Asset,
                      'DIAMOND League', false),
                  closeLeague(ImageStrings.rankingLeagueBronze5Asset,
                      'DIAMOND League', true),
                  closeLeague('assets/images/leagues/platinum.png',
                      'PLATINUM League', false),
                  closeLeague(
                      'assets/images/leagues/gold.png', 'GOLD League', true),
                  closeLeague('assets/images/leagues/silver.png',
                      'SILVER League', false),
                  closeLeague('assets/images/leagues/bronze.png',
                      'BRONZE League', true),
                  closeLeague('assets/images/leagues/copper.png',
                      'COPPER League', false),
                  closeLeague(
                      'assets/images/leagues/iron.png', 'IRON League', true),
                ],
              ),
            ),
          ),
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
