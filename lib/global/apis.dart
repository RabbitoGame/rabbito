class AppUrl {
  static const String liveBaseURL = "https://remote-ur/api/v1";
  static const String localBaseURL = "http://10.0.2.2:4000/api/v1";

  static const String baseURL = liveBaseURL;
  static const String login = baseURL + "/login";
  static const String register = baseURL + "/register";

}