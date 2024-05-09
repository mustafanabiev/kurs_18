class WeatherModel {
  const WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.temp,
    required this.country,
    required this.name,
  });

  final int id;
  final String main;
  final String description;
  final String icon;
  final double temp;
  final String country;
  final String name;
}
