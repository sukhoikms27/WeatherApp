import 'dart:async';

import 'package:meta/meta.dart';

import 'package:flutter_wthr_app/repositories/weather_api_client.dart';
import 'package:flutter_wthr_app/models/models.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({required this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Location> getLocationId(String city) async {
    return weatherApiClient.getLocation(city);
  }

  Future<OpenWeather> getWeather(Location location) async {
    return weatherApiClient.fetchWeather(location);
  }
}
