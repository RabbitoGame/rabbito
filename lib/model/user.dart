import 'package:rabbito/global/strings/user_strings.dart';

class User {
  String? username;
  String? email;
  String? accessToken;
  String? refreshToken;
  int? hearts;
  int? coin;
  int? carrot;
  int? xp;
  int? xpLevel;
  int? league;
  int? leagueLevel;

  User({
    required this.username,
    required this.email,
    required this.hearts,
    required this.carrot,
    required this.coin,
    required this.xp,
    required this.xpLevel,
    this.accessToken,
    required this.refreshToken,
  });

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        username: responseData[UserStrings.username],
        email: responseData[UserStrings.email],
        hearts: responseData[UserStrings.hearts],
        coin: responseData[UserStrings.coin],
        carrot: responseData[UserStrings.carrot],
        xp: responseData[UserStrings.xp],
        xpLevel: responseData[UserStrings.xpLevel],
        accessToken: responseData[UserStrings.accessToken],
        refreshToken: responseData[UserStrings.refreshToken]);
  }
}
