import 'package:rabbito/global/strings/image_strings.dart';

class RankingStatics {
  static var rankingResponse = {
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

  static var wordResponse = {
    "league": 3,
    "league-details": [
      {
        "index": 0,
        "words": words,
      },
      {
        "index": 1,
        "words": words,
      },
      {
        "index": 2,
        "words": words,
      },
      {
        "index": 3,
        "words": words,
      },
      {
        "index": 4,
        "words": words,
      },
      {
        "index": 5,
        "words": words,
      },
      {
        "index": 3,
        "words": words,
      },
      {
        "index": 4,
        "words": words,
      },
      {
        "index": 5,
        "words": words,
      }
    ]
  };
  static List words = [
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
    {
      "word": "sampleWord",
      "translation": "sampleTranslation",
    },
  ];
}

class LeagueDetails {
  static final List<LeagueDetails> details = [
    LeagueDetails(
      ImageStrings.rankingLeagueBronze3Asset,
      "bronze3 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueBronze2Asset,
      "bronze2 League",
      true,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueBronze1Asset,
      "bronze1 League",
      false,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueSilver3Asset,
      "silver3 League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueSilver2Asset,
      "silver2 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueSilver1Asset,
      "silver1 League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueGold3Asset,
      "gold3 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueGold2Asset,
      "gold2 League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueGold1Asset,
      "gold1 League",
      false,
    ),


    LeagueDetails(
      ImageStrings.rankingLeagueCrystal3Asset,
      "crystal3 League",
      true,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueCrystal2Asset,
      "crystal2 League",
      false,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueCrystal1Asset,
      "crystal1 League",
      true,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueEpic3Asset,
      "epic3 League",
      false,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueEpic2Asset,
      "epic2 League",
      true,
    ),

    LeagueDetails(
      ImageStrings.rankingLeagueEpic1Asset,
      "epic1 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueLegendary3Asset,
      "legendary3 League",
      true,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueLegendary2Asset,
      "legendary2 League",
      false,
    ),
    LeagueDetails(
      ImageStrings.rankingLeagueLegendary1Asset,
      "legendary1 League",
      true,
    ),

  ];
  late String image;
  late String text;
  late bool rightSide;

  LeagueDetails(this.image, this.text, this.rightSide);
}
