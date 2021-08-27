import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';

class PathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

Widget rankingMenu(BuildContext context) {
  final List<RankingRow> items = <RankingRow>[
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
    iconColor: Colors.blue,
    iconSize: 30,
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
  ExpandablePanel openableLeague(String url, String name) {
    return ExpandablePanel(
      theme: openableTheme,
      header: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Row(
          children: [
            Container(
              child: Image.asset(url, width: 40.0),
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            ),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'Railway',
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
      collapsed: SizedBox(),
      expanded: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return RankWatch();
          } else {
            return RankItem(items[index - 1], index);
          }
        },
      ),
    );
  }

  Container closeLeague(String url, String name) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
      child: Row(
        children: [
          Container(
            child: Image.asset(url, width: 40.0),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
              fontFamily: 'Railway',
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );
  }

  return SizedBox(
    height: MediaQuery.of(context).size.height - 100,
    child: ListView(
      children: <Widget>[
        CustomPaint(
          painter: PathPainter(),
        ),
        openableLeague('assets/images/leagues/gem.png', "GEM League"),
        closeLeague('assets/images/leagues/diamond.png', 'DIAMOND League'),
        closeLeague('assets/images/leagues/platinum.png', 'PLATINUM League'),
        closeLeague('assets/images/leagues/gold.png', 'GOLD League'),
        closeLeague('assets/images/leagues/silver.png', 'SILVER League'),
        closeLeague('assets/images/leagues/bronze.png', 'BRONZE League'),
        closeLeague('assets/images/leagues/copper.png', 'COPPER League'),
        closeLeague('assets/images/leagues/iron.png', 'IRON League'),
      ],
    ),
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
