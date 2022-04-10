import 'package:flutter/material.dart';

import 'package:flutter_wthr_app/models/models.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherId condition;

  WeatherConditions({Key? key, required this.condition})
      : assert(condition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherId condition) {
    Image image;
    switch (condition) {
      case WeatherId.atmosphere:
      case WeatherId.clear:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherId.snow:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherId.clouds:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherId.rain:
      case WeatherId.drizzle:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherId.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherId.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }
}
