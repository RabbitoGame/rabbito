import 'package:rabbito/global/strings/image_strings.dart';

class RankingStatics{
  static dynamic response ={
    "rank": 15,
    "league": 3,
    "competitors": [
      {
        "xp": 10,
        "image": ImageStrings.logoAsset,
        "name": "name",
        "carrot": 1034,
      },
      {
        "xp": 10,
        "image": ImageStrings.logoAsset,
        "name": "name",
        "carrot": 1034,
      },
      {
        "xp": 10,
        "image": ImageStrings.logoAsset,
        "name": "name",
        "carrot": 1034,
      },
      {
        "xp": 10,
        "image": ImageStrings.logoAsset,
        "name": "name",
        "carrot": 1034,
      },
    ],
  };
}

class LeagueDetails {
  static final List<LeagueDetails> details = [
    LeagueDetails(
      ImageStrings.rankingLeagueBroAsset,
      "GEM League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueBronze1Asset,
      "bronze1 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueBronze2Asset,
      "bronze2 League",
      true,
    ),
    LeagueDetails(
      ImageStrings.leaguePlatinumAsset,
      "plat League",
      false,
    ),
    LeagueDetails(
      ImageStrings.leagueGoldAsset,
      "gold League",
      true,
    ),
    LeagueDetails(
      ImageStrings.leagueIronAsset,
      "iron League",
      false,
    ),
    LeagueDetails(
      ImageStrings.leagueSilverAsset,
      "silver League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueBronze2Asset,
      "bronze League",
      false,
    ),
  ];
  late String image;
  late String text;
  late bool rightSide;

  LeagueDetails(this.image, this.text, this.rightSide);
}