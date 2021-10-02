import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/size_config.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/widgets/loading.dart';

import 'future_rank_leagu_widget.dart';

class RankingMenu extends StatelessWidget {
  bool isRanking;

  RankingMenu(this.isRanking);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig.screenHeight;
    double width = SizeConfig.screenWidth;
    double verticalBlock = SizeConfig.blockSizeVertical;
    double horizontalBlock = SizeConfig.blockSizeHorizontal;

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff301b49),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  toolbarHeight: height > 500 ? 55 : 45,
                  backgroundColor: Color(0xff0b5a5a),
                  expandedHeight: height > 500 ? verticalBlock * 25 : 100,
                  floating: false,
                  pinned: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(20, 30),
                      bottomRight: Radius.elliptical(20, 30),
                    ),
                  ),

                  leading: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).pop(),
                      child: Icon(
                        Icons.arrow_back,
                        size: height > 500 ? 30 : 20,
                      ),
                    ),
                  ),

                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      isRanking ? "Rankings!" : "Your Words!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: height > 500 ? 16.0:12,
                      ),
                    ),
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff0d7d7d),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(20, 30),
                          bottomRight: Radius.elliptical(20, 30),
                        ),
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          isRanking
                              ? ImageStrings.appbarCupAsset
                              : ImageStrings.profileBookAsset,
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
              child: FutureRankLeagueWidget(isRanking),
            ),
          ),
        ),
      ),
    );
  }
}
