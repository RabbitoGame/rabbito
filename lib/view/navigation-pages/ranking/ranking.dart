import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_item.dart';
import 'package:rabbito/view/navigation-pages/ranking/rank_watch.dart';
import 'package:rabbito/view/widgets/loading.dart';

import 'future_rank_leagu_widget.dart';

class RankingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color(0xff301b49),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Color(0xff0b5a5a),
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
                    background: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xff0d7d7d),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.elliptical(20, 30),
                          bottomRight: Radius.elliptical(20, 30),
                        ),
                      ),
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
              child: FutureRankLeagueWidget(),
            ),
          ),
        ),
      ),
    );
  }

}
