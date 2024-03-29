import 'dart:async';
import 'dart:convert';

import 'package:game_widget2/models/avatar.dart';
import 'package:http/http.dart';
import 'package:http/src/response.dart' as httpResponse;
import 'package:rabbito/controller/app_controller.dart';
import 'package:rabbito/global/apis.dart';
import 'package:rabbito/global/strings/image_strings.dart';
import 'package:rabbito/global/strings/request_strings.dart';
import 'package:rabbito/global/strings/user_strings.dart';
import 'package:rabbito/model/user_preferences.dart';

class User {
  static const maxHearts = 7;
  static const startCoin = 7;
  String? username;
  String? email;
  Avatar? avatar;
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
  int? id;
  DateTime? heartTime;

  User(
      {required this.username,
      Avatar? avatar,
      required this.hearts,
      required this.carrot,
      required this.coin,
      required this.xp,
      required this.xpLevel,
      required this.id,
      this.accessToken,
      required this.refreshToken,
      this.heartTime})
      : this.avatar = avatar ?? Avatar.defaultAvatar();

  factory User.fromJson(
    Map<String, dynamic> responseData,
  ) {
    Map<String, dynamic> mainData = responseData["data"];
    String heartTime;

    return User(
      username: mainData["username"],
      // fixme heart been removed
      // hearts: mainData[UserStrings.hearts],
      hearts: maxHearts,
      coin: mainData[UserStrings.coin],
      carrot: mainData[UserStrings.carrot],
      // avatar: mainData[UserStrings.avatar],
      avatar: Avatar.defaultAvatar(),
      id: mainData[UserStrings.id],
      xp: mainData[UserStrings.xp],
      xpLevel: mainData[UserStrings.xpLevel],
      accessToken: responseData[UserStrings.accessToken],
      refreshToken: responseData[UserStrings.refreshToken],
      heartTime: DateTime.now(),
    );
  }

  factory User.zeroUser(Map<String, dynamic> responseData, username) {
    return User(
      username: username,
      hearts: maxHearts,
      coin: startCoin,
      carrot: 0,
      id: responseData["data"]["id"],
      xp: 0,
      xpLevel: 1,
      accessToken: responseData[UserStrings.accessToken],
      refreshToken: responseData[UserStrings.refreshToken],
      avatar: Avatar.defaultAvatar(),
      heartTime: DateTime.now(),
    );
  }

  static logOut() {
    AppController.appController.loggedInStatus.value = Status.NotLoggedIn;
    UserPreferences.removeUser();
  }

  static Future getAccessToken({required String refreshToken}) async {
    var result;
    AppController.appController.loggedInStatus.value = Status.Authenticating;
    var refreshData = {
      UserStrings.refreshToken: refreshToken,
    };
    print("getAccessToken: before getting access token");
    httpResponse.Response response = await post(
      Uri.parse(AppUrl.refreshToken),
      body: json.encode(refreshData),
      headers: {
        RequestStrings.contentType: RequestStrings.appJson,
      },
    );
    print("getAccessToken: before checking status code");
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      var accessToken = responseData[UserStrings.accessToken];
      var refreshToken = responseData[UserStrings.refreshToken];
      // AppController.appController.currUser!.accessToken = accessToken;
      // AppController.appController.currUser!.refreshToken = refreshToken;

      AppController.appController.loggedInStatus.value = Status.LoggedIn;
      print("getAccessToken: before true result");
      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
        UserStrings.accessToken: accessToken,
        UserStrings.refreshToken: refreshToken,
      };
    } else {
      AppController.appController.loggedInStatus.value = Status.NotLoggedIn;
      print("getAccessToken: before false result");
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

      User authUser = User.fromJson(responseData);

      await UserPreferences.saveUser(authUser);

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
    print("before sending register data");
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
    print("on value");
    if (response.statusCode == 200) {
      User authUser = User.zeroUser(responseData, username);

      await UserPreferences.saveUser(authUser);
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
            "JWT " + AppController.appController.currUser!.value.accessToken!,
      },
    );
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
        RequestStrings.data: responseData,
      };
    } else {
      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
    }
    return result;
  }
  static Future<Map<String, dynamic>> getUserRankPage() async {
    var result;
    httpResponse.Response response = await get(
      Uri.parse(AppUrl.rankPage),
      headers: {
        RequestStrings.authentication:
        "JWT " + AppController.appController.currUser!.value.accessToken!,
      },
    );
    print(response.statusCode.toString());
    print("JWT " + AppController.appController.currUser!.value.accessToken!);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print("responseData in geetuserrankpage: "+ responseData.toString());
      return responseData;
      // result = {
      //   RequestStrings.status: true,
      //   RequestStrings.message: 'Successful',
      //   RequestStrings.data: responseData,
      // };
    } else {
      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
      return result;
    }

  }

  static Future<Map<String, dynamic>> transactions({
    required bool isHeart,
    required int amount,
    required bool isIncrease,
  }) async {
    var result;
    var data = {
      RequestStrings.transactionType: isIncrease ? "increase" : "decrease",
      RequestStrings.modelType: isHeart ? "heart" : "coin",
      RequestStrings.amount: amount,
      RequestStrings.gamer: AppController.appController.currUser!.value.id,
    };
    print("sallll");
    httpResponse.Response response = await post(
      Uri.parse(AppUrl.transactions),
      headers: {
        RequestStrings.authentication:
            "JWT " + AppController.appController.currUser!.value.accessToken!,
        RequestStrings.contentType: RequestStrings.appJson,
      },
      body: json.encode(data),
    );
    print("salam001");
    print(response.body.toString());
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      result = {
        RequestStrings.status: true,
        RequestStrings.message: 'Successful',
        RequestStrings.data: responseData,
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

  static String calculateLeagueImageString({required String name}) {
    if (name.length<4) return "";
    String base = ImageStrings.league;
    String main = "";
    print("Bronze1".contains(RegExp(r'Bronze')));
    if(name.contains(r'Bronze')){
      main = "Bronze_";
    }else if(name.contains(r'Silver')){
      main = "Silver_";
    }
    else if(name.contains(r'Gold')){
      main = "Gold_";
    }
    else if(name.contains(r'Crystal')){
      main = "Crystal_";
    }
    else if(name.contains(r'Epic')){
      main = "Epic_";
    }
    else if(name.contains(r'Legendary')){
      main = "Legendary_";
    }
    return base + main + name.substring(name.length - 1)+".png";
  }

  static void addHeart(int value) {
    value = AppController.appController.currUser!.value.hearts! + value;

    if (value > 7) {
      value = 7;
      AppController.appController.currUser!
          .update((val) => val!.heartTime = DateTime.now());
    }
    AppController.appController.currUser!
        .update((val) => (val as User).hearts = value);
  }

  static getUserWordPage() async{
    var result;
    httpResponse.Response response = await get(
      Uri.parse(AppUrl.wordPage),
      headers: {
        RequestStrings.authentication:
        "JWT " + AppController.appController.currUser!.value.accessToken!,
      },
    );
    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return responseData;
      // result = {
      //   RequestStrings.status: true,
      //   RequestStrings.message: 'Successful',
      //   RequestStrings.data: responseData,
      // };
    } else {
      result = {
        RequestStrings.status: false,
        RequestStrings.message: json.decode(response.body)['error'],
      };
      return result;
    }

  }
}
