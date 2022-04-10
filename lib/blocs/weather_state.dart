import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_wthr_app/models/models.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  final Location location;
  final OpenWeather weather;

  const WeatherLoadSuccess({required this.weather, required this.location}) : assert(weather != null);

  @override
  List<Object> get props => [weather, location];
}

class WeatherLoadFailure extends WeatherState {}
