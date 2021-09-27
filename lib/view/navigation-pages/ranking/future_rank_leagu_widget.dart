import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/navigation-pages/ranking/statics.dart';
import 'package:rabbito/view/widgets/loading.dart';

class FutureRankLeagueWidget extends StatelessWidget {
  int leagueNum = 5;
  bool isRanking;
  FutureRankLeagueWidget(this.isRanking);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getRankPageInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic jsonData = convertToUsefulJson(data: snapshot.data);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListView(children: makeChildren(jsonData)),
            );
          } else {
            return Center(
              child: Container(
                width: 200,
                child: LoadingWidget(Indicator.ballBeat),
              ),
            );
          }
        },
      ),
    );
  }

  Future<dynamic> getRankPageInfo() async {
    //todo get info from back
    if(isRanking){
      return Future.delayed(Duration(seconds: 1));
    }else{
      return Future.delayed(Duration(seconds: 1));
    }

  }

  ExpandableThemeData openableTheme = ExpandableThemeData(
    hasIcon: true,
    tapHeaderToExpand: true,
    iconColor: Colors.orange,
    iconSize: 30,
    headerAlignment: ExpandablePanelHeaderAlignment.center,
    iconRotationAngle: 50,
    collapseIcon: Icons.close,
    iconPadding: EdgeInsets.all(10),
  );

  buildRankingListElements(List competitors) {
    print("yasin list: "+competitors.toString());
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
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                itemCount: competitors.length,
                itemBuilder: (context, index) {
                  print("words here:"+ competitors[index].toString());
                  return RankItem(competitors[index], index + 1 ,isRanking);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  myCard({required Widget widget, required Color color}) {
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

  openableLeague(String url, String name, bool right, List competitors) {
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
          collapsed: Container(),
          expanded: buildRankingListElements(competitors),
        ),
      ),
    );
  }

  closeLeague(String url, String name, bool right) {
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

  convertToUsefulJson({data}) {
    //todo compete data conversion
    if(isRanking){
      return RankingStatics.rankingResponse;
    }else{
      return RankingStatics.wordResponse;
    }

  }

  List<Widget> makeChildren(jsonData) {
    if(isRanking){
      int leagueIndex = jsonData["league"];
      int rank = jsonData["rank"];
      List competitors = jsonData["competitors"];
      return List<Widget>.generate(leagueNum, (index) {
        LeagueDetails leagueDetail = LeagueDetails.details.elementAt(index);
        if (index == leagueIndex) {
          return openableLeague(leagueDetail.image, leagueDetail.text,
              leagueDetail.rightSide, competitors);
        } else {
          return closeLeague(
              leagueDetail.image, leagueDetail.text, leagueDetail.rightSide);
        }
      }).toList();
    }else{
      int leagueIndex = jsonData["league"];
      List jsonWords = jsonData["league-details"];
      return List<Widget>.generate(leagueNum, (index) {
        LeagueDetails leagueDetail = LeagueDetails.details.elementAt(index);
        if (index <= leagueIndex) {
          return openableLeague(leagueDetail.image, leagueDetail.text,
              leagueDetail.rightSide, jsonWords.elementAt(index)["words"]);
        } else {
          return closeLeague(
              leagueDetail.image, leagueDetail.text, leagueDetail.rightSide);
        }
      }).toList();
    }

  }


}

