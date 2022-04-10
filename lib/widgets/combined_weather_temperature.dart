import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_wthr_app/blocs/blocs.dart';
import 'package:flutter_wthr_app/models/models.dart' as model;
import 'package:flutter_wthr_app/widgets/widgets.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final model.CurrentWeather currentWeather;

  CombinedWeatherTemperature({
    Key? key,
    required this.currentWeather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: WeatherConditions(condition: currentWeather.weather.weatherId),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return Temperature(
                    temperature: currentWeather.temp,
                    high: 0,
                    low: 0,
                    units: state.temperatureUnits,
                  );
                },
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            currentWeather.weather.description,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
