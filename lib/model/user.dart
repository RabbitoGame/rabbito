import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/global/apis.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/model/user_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/src/response.dart' as httpResponse;

class User {
  static const maxHearts = 7;
  static const startCoin = 7;
  String? username;
  String? email;
  String? avatar;
  String? joinDate;
  String? accessToken;
  String? refreshToken;
  int? hearts;
  int? coin;
  int? carrot;
  int? xp;
  int? xpLevel;
  int? league;
  int? leagueLevel;
  int? rank;

  User({
    required this.username,
    required this.hearts,
    required this.carrot,
    required this.coin,
    required this.xp,
    required this.xpLevel,
    this.accessToken,
    required this.refreshToken,
  });

  // league: mainData[UserStrings.league],
  // rank: mainData[UserStrings.rank],
  // avatar: mainData[UserStrings.avatar],
  // joinDate: mainData[UserStrings.joinDate],
  factory User.fromJson(
    Map<String, dynamic> responseData,
    String username,
  ) {
    Map<String, dynamic> mainData = responseData["data"];
    return User(
        username: username,
        hearts: mainData[UserStrings.hearts],
        coin: mainData[UserStrings.coin],
        carrot: mainData[UserStrings.carrot],
        // xp: mainData[UserStrings.xp],
        // xplevel: mainData[UserStrings.xpLevel],
        xp: 0,
        xpLevel: 0,
        accessToken: responseData[UserStrings.accessToken],
        refreshToken: responseData[UserStrings.refreshToken]);
  }

  factory User.zeroUser(Map<String, dynamic> responseData, username) {
    return User(
        username: username,
        hearts: maxHearts,
        coin: startCoin,
        carrot: 0,
        xp: 0,
        xpLevel: 0,
        accessToken: responseData[UserStrings.accessToken],
        refreshToken: responseData[UserStrings.refreshToken]);
  }

  static Future getAccessToken() async {
    var result;
    AppController.appController.loggedInStatus.value = Status.Authenticating;
    var refreshData = {
      UserStrings.refreshToken:
          AppController.appController.currUser!.refreshToken,
    };
    httpResponse.Response response = await post(
      Uri.parse(AppUrl.refreshToken),
      body: json.encode(refreshData),
      headers: {
        RequestStrings.contentType: RequestStrings.appJson,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var accessToken = responseData[UserStrings.accessToken];
      var refreshToken = responseData[UserStrings.refreshToken];
      AppController.appController.currUser!.accessToken = accessToken;
      AppController.appController.currUser!.refreshToken = refreshToken;

      AppController.appController.loggedInStatus.value = Status.LoggedIn;

      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
      };
    } else {
      AppController.appController.loggedInStatus.value = Status.NotLoggedIn;

      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
    }
    print(result.toString());
    return result;
  }

  @override
  String toString() {
    return "\nuser{\n\tcarrot: ${this.carrot}\n" +
        "\tcoin: ${this.coin}\n\tusername: ${this.username}\n" +
        "\temail: ${this.email}\n\thearts: ${this.hearts}\n" +
        "\taccess token: ${this.accessToken}\n" +
        "\trefresh token: ${this.refreshToken}\n}";
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
    print(response.statusCode.toString());
    print(response.headers.toString());
    print(response.body.toString());
    print("inside login");
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      User authUser = User.fromJson(responseData, username);

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
        headers: {
          RequestStrings.contentType: RequestStrings.appJson,
          RequestStrings.headerAccess: "*"
        }).then((e) => onValue(e, username, email)).catchError(onError);
  }

  static Future<Map<String, dynamic>> onValue(
      httpResponse.Response response, String username, String email) async {
    var result;
    print(response.statusCode.toString());
    print(response.headers.toString());
    print(response.body.toString());
    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200) {
      User authUser = User.zeroUser(responseData, username);

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

  static Future<Map<String, dynamic>> getUserDetails() async {
    var result;
    httpResponse.Response response = await get(
      Uri.parse(AppUrl.userDetails),
      headers: {
        RequestStrings.authentication:
            AppController.appController.currUser!.accessToken!,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      AppController.appController.currUser = User.fromJson(
          responseData, responseData["data"][UserStrings.username]);
      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
      };
    } else {
      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
    }
    return result;
  }

  static onError(error) {
    print("the error is ${error}");
    return {
      RequestStrings.status: false,
      RequestStrings.message: 'Unsuccessful Request',
      RequestStrings.data: error,
    };
  }

  static getUserDetail() {
    //todo complete getUserDetail
  }

  static getCarrot() {
    //todo complete getCarrot
  }

  static getCoin() {
    //todo complete getCoin
  }

  static getHeart() {
    //todo complete getHeart
  }

  static getRank() {
    //todo complete getRank
  }

  static setCarrot() {
    //todo complete setCarrot
  }

  static setCoin() {
    //todo complete setCoin
  }

  static setHeart() {
    //todo complete setHeart
  }

  static setRank() {
    //todo complete setRank
  }
}
