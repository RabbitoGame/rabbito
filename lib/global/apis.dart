class AppUrl {
  static const String liveBaseURL = "https://rabbito-back-end.herokuapp.com/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";
  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/login/";
  static const String register = baseURL + "/register/";
  static const String refreshToken = baseURL + "/token/refresh/";
  static const String gamers = baseURL + "/gamers/";
  static const String game = baseURL + "/game/";
  static const String finance = baseURL + "/finance/";
  static const String transactions = baseURL + "/gamers/transactions/";
  static const String userDetails = baseURL + "/gamers/user-details/";
  // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
  // "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  // "Access-Control-Allow-Methods": "POST, OPTIONS";
}
