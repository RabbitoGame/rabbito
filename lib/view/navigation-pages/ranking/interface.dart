import 'package:flutter/material.dart';
import 'package:rabbito/model/user.dart';
import 'package:rabbito/view/navigation-pages/ranking/ranking.dart';

class Interface extends StatelessWidget {
  bool isRanking;

  Interface(this.isRanking);

  @override
  Widget build(BuildContext context) {
    if(isRanking){
      return RankingMenu(true);
    }else{
      return RankingMenu(false);
    }

  }
}
