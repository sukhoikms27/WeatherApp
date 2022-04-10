import 'dart:developer';

import 'package:meta/meta.dart';
import 'package:flutter_wthr_app/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org';
  final http.Client httpClient;

  WeatherApiClient({
    required this.httpClient,
  }) : assert(httpClient != null);

  Future<Location> getLocation(String city) async {
    final locationUrl = '$baseUrl/geo/1.0/direct?q=$city&appid=$APIKEY';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting geocoords for city');
    }
    final locationFirst = jsonDecode(locationResponse.body) as List;
    return Location.fromJson(locationFirst.first);
  }

  Future<OpenWeather> fetchWeather(Location location) async {
    final lat = location.lat;
    final lon = location.lon;
    final weatherUrl = '$baseUrl/data/2.5/onecall?lat=$lat&lon=$lon&exclude=hourly,daily&appid=$APIKEY';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));
    print(weatherResponse);
    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }
    print(weatherResponse.body);
    final weatherJson = jsonDecode(weatherResponse.body);
    return OpenWeather.fromJson(weatherJson);
  }
}
