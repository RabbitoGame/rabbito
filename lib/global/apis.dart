class AppUrl {
  static const String liveBaseURL = "https://rabbito-back-end.herokuapp.com/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";
  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/login/";
  static const String register = baseURL + "/register/";
  static const String refreshToken = baseURL + "/token/refresh/";
  static const String userInfo = baseURL + "/get-user-info/";
  static const String gamers = baseURL + "/gamers/";
  static const String game = baseURL + "/game/";
  static const String finance = baseURL + "/finance/";
}
