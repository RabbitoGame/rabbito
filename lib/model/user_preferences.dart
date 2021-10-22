import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/main.dart';
import 'package:rabbito/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class UserPreferences {
  static Future saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(UserStrings.username, user.username!);
    prefs.setInt(UserStrings.hearts, user.hearts!);
    prefs.setInt(UserStrings.carrot, user.carrot!);
    prefs.setInt(UserStrings.coin, user.coin!);
    prefs.setInt(UserStrings.xp, user.xp!);
    prefs.setInt(UserStrings.xpLevel, user.xpLevel!);
    prefs.setInt(UserStrings.id, user.id!);
    prefs.setString(UserStrings.heartTime, DateTime.now().toString());

    //todo save token using secure storage
    FlutterSecureStorage _storage = FlutterSecureStorage();
    await _storage.write(
        key: UserStrings.refreshToken, value: user.refreshToken);

    if (prefs.containsKey(UserStrings.username)) {
      print("shared prefs: " + prefs.getString(UserStrings.username)!);
    } else {
      print("shared prefs: not contains ");
    }
  }

  static Future saveMusic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setDouble(
        UserStrings.musicLevel, AppController.appController.musicVolume);
    prefs.setDouble(UserStrings.soundEffectsLevel,
        AppController.appController.soundEffectsVolume);
  }

  static Future readMusic() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(UserStrings.musicLevel)) {
      AppController.appController.musicVolume =
          prefs.getDouble(UserStrings.musicLevel)!;
      AppController.appController.soundEffectsVolume =
          prefs.getDouble(UserStrings.soundEffectsLevel)!;
    }
    AppController.appController.menuMusicAudioPlayer
        .setVolume(AppController.appController.musicVolume);
    AppController.appController.effectsAudioPlayer
        .setVolume(AppController.appController.soundEffectsVolume);
  }

  static Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? username = prefs.getString(UserStrings.username);
    int? hearts = prefs.getInt(UserStrings.hearts);
    int? carrot = prefs.getInt(UserStrings.carrot);
    int? coin = prefs.getInt(UserStrings.coin);
    int? xp = prefs.getInt(UserStrings.xp);
    int? xpLevel = prefs.getInt(UserStrings.xpLevel);
    int? id = prefs.getInt(UserStrings.id);
    String? heartTimeString = prefs.getString(UserStrings.heartTime);
    DateTime heartTime = DateTime.parse(heartTimeString!);
    var diff = DateTime.now().difference(heartTime).inMinutes;

    //todo read refresh token by secure storage
    String? refreshToken = await getRefreshToken();

    return User(
      id: id,
      xp: xp,
      carrot: carrot,
      coin: coin,
      hearts: hearts,
      username: username,
      xpLevel: xpLevel,
      refreshToken: refreshToken,
    );
  }

  static void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove(UserStrings.username);
    prefs.remove(UserStrings.xp);
    prefs.remove(UserStrings.xpLevel);
    prefs.remove(UserStrings.coin);
    prefs.remove(UserStrings.carrot);
    prefs.remove(UserStrings.hearts);
    prefs.remove(UserStrings.id);
  }

  static Future<String?> getRefreshToken() async {
    //todo change it with secure storage
    FlutterSecureStorage _storage = FlutterSecureStorage();
    String? refreshToken = await _storage.read(key: UserStrings.refreshToken);
    return refreshToken;
  }
}
