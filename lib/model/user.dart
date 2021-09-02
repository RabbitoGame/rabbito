import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/global/apis.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart' as httpResponse;

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
    Map<String, dynamic> mainData = responseData["data"];
    return User(
        username: mainData[UserStrings.username],
        email: mainData[UserStrings.email],
        hearts: mainData[UserStrings.hearts],
        coin: mainData[UserStrings.coin],
        carrot: mainData[UserStrings.carrot],
        xp: mainData[UserStrings.xp],
        xpLevel: mainData[UserStrings.xpLevel],
        accessToken: responseData[UserStrings.accessToken],
        refreshToken: responseData[UserStrings.refreshToken]);
  }

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      UserStrings.username: username,
      UserStrings.password: password,
    };

    AppController.appController.loggedInStatus.value = Status.Authenticating;

    httpResponse.Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {
        RequestStrings.contentType: RequestStrings.appJson,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      AppController.appController.loggedInStatus.value = Status.LoggedIn;

      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
        RequestStrings.data: authUser,
      };
    } else {
      AppController.appController.loggedInStatus.value = Status.NotLoggedIn;

      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
    }
    return result;
  }

  static Future<Map<String, dynamic>> register(
    String username,
    String password,
    String email,
  ) async {
    final Map<String, dynamic> registrationData = {
      UserStrings.email: email,
      UserStrings.password: password,
      UserStrings.username: username,
    };

    AppController.appController.registeredInStatus.value = Status.Registering;

    return await post(Uri.parse(AppUrl.register),
            body: json.encode(registrationData),
            headers: {RequestStrings.contentType: RequestStrings.appJson})
        .then(onValue)
        .catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(
      httpResponse.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var userData = responseData[RequestStrings.data];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successfully registered',
        RequestStrings.data: authUser
      };
    } else {
      result = {
        RequestStrings.status: false,
        RequestStrings.message: 'Registration failed',
        RequestStrings.data: responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {
      RequestStrings.status: false,
      RequestStrings.message: 'Unsuccessful Request',
      RequestStrings.data: error,
    };
  }
}
