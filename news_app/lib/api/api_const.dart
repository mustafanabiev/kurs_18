class ApiConst {
  static const String apiKey = '3548d4bfaff946688fc6cb2fdee369d0';
  static const String api =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  static String searchApi(String title) {
    return 'https://newsapi.org/v2/everything?q=$title&apiKey=$apiKey';
  }
}
