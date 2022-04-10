import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter_wthr_app/repositories/repositories.dart';
import 'package:flutter_wthr_app/models/models.dart';
import 'package:flutter_wthr_app/blocs/blocs.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(
      WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final Location location = await weatherRepository.getLocationId(event.city);
      print(location);
      final OpenWeather weather = await weatherRepository.getWeather(location);
      print(weather);
      yield WeatherLoadSuccess(weather: weather, location: location);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(
      WeatherRefreshRequested event) async* {
    try {
      final Location location = await weatherRepository.getLocationId(event.city);
      final OpenWeather weather = await weatherRepository.getWeather(location);
      yield WeatherLoadSuccess(weather: weather, location: location);
    } catch (_) {}
  }
}
