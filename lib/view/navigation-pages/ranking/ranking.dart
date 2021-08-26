import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';

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
        image: 'assets/images/logo.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png'),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: 'assets/images/logo.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png'),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: 'assets/images/logo.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png'),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: 'assets/images/logo.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png'),
    RankingRow(
        name: 'ali',
        rank: League.Diamond,
        cups: 23,
        image: 'assets/images/appbar/logo.png'),
    RankingRow(
        name: 'hasan',
        rank: League.Diamond,
        cups: 50,
        image: 'assets/images/appbar/cup.png')
  ];

  Widget wid() {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child:
                    Image.asset('assets/images/leagues/gem.png', width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'GEM League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xff17A0F2),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/leagues/diamond.png',
                    width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'DIAMOND League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffB9F2FF),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/leagues/platinum.png',
                    width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'PLATINUM League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffE5E4E2),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child:
                    Image.asset('assets/images/leagues/gold.png', width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'GOLD League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffFFD700),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/leagues/silver.png',
                    width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'SILVER League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffC0C0C0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/leagues/bronze.png',
                    width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'BRONZE League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffCD7F32),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child: Image.asset('assets/images/leagues/copper.png',
                    width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'COPPER League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffB87333),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            )),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Container(
                child:
                    Image.asset('assets/images/leagues/iron.png', width: 40.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              ),
              Text(
                'IRON League',
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
        SizedBox(
            height: 200,
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    color: const Color(0xffa19d94),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(items[index].image),
                      ),
                      title: Text(items[index].name),
                      subtitle: Text(items[index].cups.toString()),
                    ));
              },
            ))
      ],
    );
  }

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

  return SizedBox(
    height: MediaQuery.of(context).size.height - 100,
    child: ListView(
      children: <Widget>[
        CustomPaint(
          painter: PathPainter(),
        ),
        ExpandablePanel(
          theme: openableTheme,
          header: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Container(
                  child:
                      Image.asset('assets/images/leagues/gem.png', width: 40.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Text(
                  'GEM League',
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RankItem(items[index] , index);
            },
          ),
        ),
        ExpandablePanel(
          theme: closeTheme,
          header: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
            child: Row(
              children: [
                Container(
                  child: Image.asset('assets/images/leagues/diamond.png',
                      width: 40.0),
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                ),
                Text(
                  'DIAMOND League',
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  color: const Color(0xff17A0F2),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(items[index].image),
                    ),
                    title: Text(items[index].name),
                    subtitle: Text(items[index].cups.toString()),
                  ));
            },
          ),
        ),
      ],
    ),
  );
}

class RankingRow {
  late String name;
  late League rank;
  late int cups;
  late String image;

  RankingRow(
      {required this.name,
      required this.rank,
      required this.cups,
      required this.image});
}

enum League { Gem, Diamond, Platinum, Gold, Silver, Bronze, Copper, Iron }
