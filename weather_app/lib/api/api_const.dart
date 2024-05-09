class ApiConst {
  static const String apiKey = '8399a11d4cc690469e5d3c2caa02dc98';

  static String getWeatherCityName({String? city}) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=${city ?? 'bishkek'}&appid=$apiKey';
  }

  static String getIcon(String icon) {
    return 'https://openweathermap.org/img/wn/$icon@4x.png';
  }

  static String getLocation({
    required String lat,
    required String long,
  }) {
    return 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey';
  }
}
