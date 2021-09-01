import 'package:rabbito/global/apis.dart';
import 'package:rabbito/model/user_preferences.dart';

import '../model/user.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart' as httpResponse;

class AppController extends GetxController {
  static late AppController appController;
  Rx<bool> _firstEntrance = true.obs;
  Rx<Status> _loggedInStatus = Status.NotLoggedIn.obs;
  Rx<Status> _registeredInStatus = Status.NotRegistered.obs;

  User? currUser;

  @override
  void onInit() async {
    await prefsOnInit();
    // await setMusic();
    super.onInit();
  }

  Rx<bool> get firstEntrance => _firstEntrance;

  set firstEntrance(Rx<bool> value) {
    _firstEntrance = value;
  }

  prefsOnInit() async {
    print('AppController::prefsOnInit');
    // await getUserFromPrefs();
    // await getMusicVolumePrefs();
    update();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'user': {'email': email, 'password': password}
    };

    _loggedInStatus.value = Status.Authenticating;
    update();

    httpResponse.Response response = await post(
      Uri.parse(AppUrl.login),
      body: json.encode(loginData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);

      _loggedInStatus.value = Status.LoggedIn;


      result = {'status': true, 'message': 'Successful', 'user': authUser};
    } else {
      _loggedInStatus.value = Status.NotLoggedIn;

      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  Future<dynamic>  register(
      String email, String password, String passwordConfirmation) async {
    final Map<String, dynamic> registrationData = {
      'user': {
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    };

    _registeredInStatus.value = Status.Registering;


    return await post(Uri.parse(AppUrl.register),
            body: json.encode(registrationData),
            headers: {'Content-Type': 'application/json'})
        .then(onValue)
        .catchError(onError);
  }

  static Future<FutureOr> onValue(httpResponse.Response response) async {
    var result;
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      var userData = responseData['data'];

      User authUser = User.fromJson(userData);

      UserPreferences().saveUser(authUser);
      result = {
        'status': true,
        'message': 'Successfully registered',
        'data': authUser
      };
    } else {
      result = {
        'status': false,
        'message': 'Registration failed',
        'data': responseData
      };
    }

    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}
