import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:weather_app/api/api_const.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/utils/temp.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherModel? weatherModel;

  List<String> cities = [
    'bishkek',
    'osh',
    'batken',
    'naryn',
    'jalalabad',
    'talas',
  ];

  Future<void> getWeatherLocation() async {
    try {
      setState(() {
        weatherModel = null;
      });
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.always ||
            permission == LocationPermission.whileInUse) {
          Position position = await Geolocator.getCurrentPosition();
          final http = Client();
          final url = Uri.parse(ApiConst.getLocation(
            lat: '${position.latitude}',
            long: position.longitude.toString(),
          ));
          final response = await http.get(url);
          if (response.statusCode == 200) {
            final body = jsonDecode(response.body);
            setState(() {
              weatherModel = WeatherModel(
                id: body['weather'][0]['id'],
                main: body['weather'][0]['main'],
                description: body['weather'][0]['description'],
                icon: body['weather'][0]['icon'],
                temp: body['main']['temp'],
                country: body['sys']['country'],
                name: body['name'],
              );
            });
          }
        }
      } else {
        Position position = await Geolocator.getCurrentPosition();
        final http = Client();
        final url = Uri.parse(ApiConst.getLocation(
          lat: '${position.latitude}',
          long: position.longitude.toString(),
        ));
        final response = await http.get(url);
        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          setState(() {
            weatherModel = WeatherModel(
              id: body['weather'][0]['id'],
              main: body['weather'][0]['main'],
              description: body['weather'][0]['description'],
              icon: body['weather'][0]['icon'],
              temp: body['main']['temp'],
              country: body['sys']['country'],
              name: body['name'],
            );
          });
        }
      }
    } catch (e) {
      log(e.toString(), name: 'error');
    }
  }

  Future<void> getWeather({String? cityName}) async {
    try {
      final http = Client();
      final url = Uri.parse(ApiConst.getWeatherCityName(city: cityName));
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        setState(() {
          weatherModel = WeatherModel(
            id: body['weather'][0]['id'],
            main: body['weather'][0]['main'],
            description: body['weather'][0]['description'],
            icon: body['weather'][0]['icon'],
            temp: body['main']['temp'],
            country: body['sys']['country'],
            name: body['name'],
          );
        });
      }
    } catch (error) {
      log(error.toString(), name: 'error');
    }
  }

  @override
  void initState() {
    getWeather(cityName: 'osh');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF4F3F3),
        title: const Text(
          'ТАПШЫРМА - 09',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: weatherModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/weather.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          getWeatherLocation();
                        },
                        icon: const Icon(Icons.near_me),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                      IconButton(
                        onPressed: () {
                          bottomSheet();
                        },
                        icon: const Icon(Icons.location_city),
                        color: Colors.white,
                        iconSize: 50,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          temp(weatherModel!.temp),
                          style: const TextStyle(
                            fontSize: 100,
                            color: Colors.white,
                          ),
                        ),
                        Image.network(ApiConst.getIcon(weatherModel!.icon)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        weatherModel!.description.replaceAll(' ', '\n'),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        weatherModel!.name,
                        style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void bottomSheet() {
    showModalBottomSheet<void>(
      backgroundColor: const Color.fromARGB(255, 153, 221, 255),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text(
                    'Шаарды танды',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  final city = cities[index];
                  return GestureDetector(
                    onTap: () {
                      getWeather(cityName: city);
                      Navigator.pop(context);
                    },
                    child: Card(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          city,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
