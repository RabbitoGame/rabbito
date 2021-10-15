import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/navigation-pages/ranking/statics.dart';
import 'package:rabbito/view/widgets/loading.dart';

class FutureRankLeagueWidget extends StatelessWidget {
  int leagueNum = 5;
  bool isRanking;

  FutureRankLeagueWidget(this.isRanking);

  AutoSizeGroup titleGroup = AutoSizeGroup();
  AutoSizeGroup itemGroup = AutoSizeGroup();
  var radius;
  var lowPadding;
  var highPadding;
  var backButtonSize;
  var iconWidth;
  var height;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print("height inside wheel: " + SizeConfig.screenHeight.toString());
    radius = SizeConfig.blockSizeHorizontal * 1;
    lowPadding = SizeConfig.blockSizeHorizontal * 1;
    highPadding = SizeConfig.blockSizeHorizontal * 3;
    backButtonSize = SizeConfig.blockSizeHorizontal * 12;
    iconWidth = SizeConfig.blockSizeHorizontal * 12;
    double horizontalBlock = SizeConfig.blockSizeHorizontal;
    height = SizeConfig.blockSizeVertical * 15;
    return Container(
      child: FutureBuilder(
        future: getRankPageInfo(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            dynamic jsonData = convertToUsefulJson(data: snapshot.data);
            return Padding(
              padding: EdgeInsets.only(bottom: lowPadding),
              child: ListView(children: makeChildren(jsonData)),
            );
          } else {
            return Center(
              child: Container(
                width: horizontalBlock * 30,
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
    if (isRanking) {
      return Future.delayed(Duration(seconds: 0));
    } else {
      return Future.delayed(Duration(seconds: 0));
    }
  }

  ExpandableThemeData openableTheme() {
    return ExpandableThemeData(
      hasIcon: true,
      tapHeaderToExpand: true,
      iconColor: isRanking?Colors.orange: Colors.white,
      iconSize: iconWidth,
      headerAlignment: ExpandablePanelHeaderAlignment.center,
      iconRotationAngle: 50,
      collapseIcon: Icons.close,
      iconPadding: EdgeInsets.all(lowPadding * 3),
    );
  }

  buildRankingListElements(List competitors, int rank) {
    print("yasin list: " + competitors.toString());
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          topLeft: Radius.circular(0),
          bottomRight: Radius.circular(radius * 4),
          bottomLeft: Radius.circular(radius * 4),
        ),
      ),
      child: isRanking
          ? Stack(
              overflow: Overflow.visible,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: lowPadding,
                    right: lowPadding,
                    top: lowPadding,
                    bottom: lowPadding * 2,
                  ),
                  child: RankWatch(rank),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height,
                    ),
                    ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          vertical: lowPadding*2, horizontal: lowPadding),
                      itemCount: competitors.length,
                      itemBuilder: (context, index) {
                        print("words here:" + competitors[index].toString());
                        return RankItem(competitors[index], index + 1,
                            isRanking, itemGroup);
                      },
                    ),
                  ],
                ),
              ],
            )
          : ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 2,
                horizontal: SizeConfig.blockSizeHorizontal * 2,
              ),
              itemCount: competitors.length,
              itemBuilder: (context, index) {
                return RankItem(
                    competitors[index], index + 1, isRanking, itemGroup);
              },
            ),
    );
  }

  myCard({required Widget widget, required Color color}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 20,
      color: isRanking?Color(0xff3c2457):Colors.green,
      child: widget,
    );
  }

  openableLeague(
      String url, String name, bool right, List competitors, int rank) {
    return Padding(
      padding: right
          ? EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5)
          : EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
      child: myCard(
        color: Colors.blueAccent,
        widget: ExpandablePanel(
          theme: openableTheme(),
          header: Container(
            padding: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal * 5,
                SizeConfig.blockSizeHorizontal * 3,
                0,
                SizeConfig.blockSizeHorizontal * 3),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Image.asset(url),
                    padding: EdgeInsets.fromLTRB(
                        0, 0, SizeConfig.blockSizeHorizontal * 2, 0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AutoSizeText(
                    name,
                    group: titleGroup,
                    maxLines: 1,
                    minFontSize: 12,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Railway',
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          collapsed: Container(),
          expanded: buildRankingListElements(competitors, rank),
        ),
      ),
    );
  }

  closeLeague(String url, String name, bool right) {
    return Padding(
      padding: right
          ? EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 5)
          : EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
      child: myCard(
        color: Colors.amber,
        widget: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    url,
                    fit: BoxFit.fill,
                  ),
                  padding: EdgeInsets.fromLTRB(
                      0, 0, SizeConfig.blockSizeHorizontal * 2, 0),
                ),
              ),
              Expanded(
                flex: 2,
                child: AutoSizeText(
                  name,
                  group: titleGroup,
                  minFontSize: 12,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Railway',
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
    );
  }

  convertToUsefulJson({data}) {
    //todo compete data conversion
    if (isRanking) {
      return RankingStatics.rankingResponse;
    } else {
      return RankingStatics.wordResponse;
    }
  }

  List<Widget> makeChildren(jsonData) {
    if (isRanking) {
      int leagueIndex = jsonData["league"];
      int rank = jsonData["rank"];
      List competitors = jsonData["competitors"];
      return List<Widget>.generate(leagueNum, (index) {
        LeagueDetails leagueDetail = LeagueDetails.details.elementAt(index);
        if (index == leagueIndex) {
          return openableLeague(leagueDetail.image, leagueDetail.text,
              leagueDetail.rightSide, competitors, rank);
        } else {
          return closeLeague(
              leagueDetail.image, leagueDetail.text, leagueDetail.rightSide);
        }
      }).toList();
    } else {
      int leagueIndex = jsonData["league"];
      List jsonWords = jsonData["league-details"];
      return List<Widget>.generate(leagueNum, (index) {
        LeagueDetails leagueDetail = LeagueDetails.details.elementAt(index);
        if (index >= leagueIndex) {
          return openableLeague(leagueDetail.image, leagueDetail.text,
              leagueDetail.rightSide, jsonWords.elementAt(index)["words"], -1);
        } else {
          return closeLeague(
              leagueDetail.image, leagueDetail.text, leagueDetail.rightSide);
        }
      }).toList();
    }
  }
}
