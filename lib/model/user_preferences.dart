import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(UserStrings.username, user.username!);
    prefs.setInt(UserStrings.hearts, user.hearts!);
    prefs.setInt(UserStrings.carrot, user.carrot!);
    prefs.setInt(UserStrings.coin, user.coin!);
    prefs.setInt(UserStrings.xp, user.xp!);
    prefs.setInt(UserStrings.xpLevel, user.xpLevel!);

    //todo save token using secure storage
    FlutterSecureStorage _storage = FlutterSecureStorage();
    await _storage.write(
        key: UserStrings.refreshToken, value: user.refreshToken);

    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString(UserStrings.username);
    String? email = prefs.getString(UserStrings.email);
    int? hearts = prefs.getInt(UserStrings.hearts);
    int? carrot = prefs.getInt(UserStrings.carrot);
    int? coin = prefs.getInt(UserStrings.coin);
    int? xp = prefs.getInt(UserStrings.xp);
    int? xpLevel = prefs.getInt(UserStrings.xpLevel);

    //todo read refresh token by secure storage
    Future<String?> refreshToken = getRefreshToken();

    return User(
      xp: xp,
      carrot: carrot,
      coin: coin,
      email: email,
      hearts: hearts,
      username: username,
      xpLevel: xpLevel,
      refreshToken: (refreshToken as String?),
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(UserStrings.username);
    prefs.remove(UserStrings.xp);
    prefs.remove(UserStrings.xpLevel);
    prefs.remove(UserStrings.coin);
    prefs.remove(UserStrings.carrot);
    prefs.remove(UserStrings.hearts);
  }

  Future<String?> getRefreshToken() async {
    //todo change it with secure storage
    FlutterSecureStorage _storage = FlutterSecureStorage();
    String? refreshToken = await _storage.read(key: UserStrings.refreshToken);
    return refreshToken;
  }
}
