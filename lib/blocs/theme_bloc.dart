import 'dart:async';

import 'package:flutter/material.dart';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_wthr_app/models/models.dart';

class ThemeState extends Equatable {
  final ThemeData theme;
  final MaterialColor color;

  const ThemeState({required this.theme, required this.color});

  @override
  List<Object> get props => [theme, color];
}

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class WeatherChanged extends ThemeEvent {
  final WeatherId condition;

  const WeatherChanged({required this.condition}) : assert(condition != null);

  @override
  List<Object> get props => [condition];
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(theme: ThemeData.light(), color: Colors.lightBlue));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is WeatherChanged) {
      yield _mapWeatherConditionToThemeData(event.condition);
    }
  }

  ThemeState _mapWeatherConditionToThemeData(WeatherId condition) {
    ThemeState theme;
    switch (condition) {
      case WeatherId.clear:
      case WeatherId.clouds:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          color: Colors.yellow,
        );
        break;
      case WeatherId.snow:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          color: Colors.lightBlue,
        );
        break;
      // case WeatherCondition.heavyCloud:
      //   theme = ThemeState(
      //     theme: ThemeData(
      //       primaryColor: Colors.blueGrey,
      //     ),
      //     color: Colors.grey,
      //   );
      //   break;
      // case WeatherCondition.heavyRain:
      case WeatherId.drizzle:
      case WeatherId.rain:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        );
        break;
      case WeatherId.thunderstorm:
        theme = ThemeState(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          color: Colors.deepPurple,
        );
        break;
      case WeatherId.atmosphere:
      case WeatherId.unknown:
        theme = ThemeState(
          theme: ThemeData.light(),
          color: Colors.lightBlue,
        );
        break;
    }
    return theme;
  }
}
