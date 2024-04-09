// ignore_for_file: constant_identifier_names

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

const String apiKey = '30099d4c210a4289b8bc9a9e6430ecb1';
// 3f07d20249324058985a865638e6190c

final class Endpoints {
  Endpoints._();
  //backend_url
  static const String baseUrl = 'https://newsapi.org/v2';
  static String allNews(String? searchText) =>
      "/top-headlines?country=us&q=$searchText&apiKey=$apiKey";
}
