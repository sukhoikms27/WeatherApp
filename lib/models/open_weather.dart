import 'package:equatable/equatable.dart';

enum WeatherId {
  thunderstorm,
  drizzle, //sleet
  rain,
  snow,
  atmosphere,
  clear,
  clouds,
  unknown
}

class Weather extends Equatable {
  final WeatherId weatherId; 
  final String mainParameter;
  final String description;
  
  const Weather ({
    required this.weatherId,
    required this.mainParameter,
    required this.description,
  });

  @override
  List<Object> get props => [
    weatherId,
    mainParameter,
    description
  ];

  static Weather fromJson(dynamic weather) {
    return Weather(
      weatherId: _mapIntToWeatherId(weather.first['id']),
      mainParameter: weather.first['main'],
      description: weather.first['description'],
    );
  }

    static WeatherId _mapIntToWeatherId(num input) {
    WeatherId state;
    switch (input) {
      case 200 :
        state = WeatherId.thunderstorm;
        break;
      case 201:
        state = WeatherId.thunderstorm;
        break;
      case 202:
        state = WeatherId.thunderstorm;
        break;
      case 210:
        state = WeatherId.thunderstorm;
        break;
      case 211:
        state = WeatherId.thunderstorm;
        break;
      case 212:
        state = WeatherId.thunderstorm;
        break;
      case 221:
        state = WeatherId.thunderstorm;
        break;
      case 230:
        state = WeatherId.thunderstorm;
        break;
      case 231:
        state = WeatherId.thunderstorm;
        break;
      case 232:
        state = WeatherId.thunderstorm;
        break;
      case 300:
        state = WeatherId.drizzle;
        break;
      case 301:
        state = WeatherId.drizzle;
        break;
      case 302:
        state = WeatherId.drizzle;
        break;
      case 310:
        state = WeatherId.drizzle;
        break;
      case 311:
        state = WeatherId.drizzle;
        break;
      case 312:
        state = WeatherId.drizzle;
        break;
      case 313:
        state = WeatherId.drizzle;
        break;
      case 314:
        state = WeatherId.drizzle;
        break;
      case 321:
        state = WeatherId.drizzle;
        break;
      case 500:
        state = WeatherId.rain;
        break;
      case 501:
        state = WeatherId.rain;
        break;
      case 502:
        state = WeatherId.rain;
        break;
      case 503:
        state = WeatherId.rain;
        break;
      case 504:
        state = WeatherId.rain;
        break;
      case 511:
        state = WeatherId.rain;
        break;
      case 520:
        state = WeatherId.rain;
        break;
      case 521:
        state = WeatherId.rain;
        break;
      case 522:
        state = WeatherId.rain;
        break;
      case 531:
        state = WeatherId.rain;
        break;
      case 600:
        state = WeatherId.snow;
        break;
      case 601:
        state = WeatherId.snow;
        break;
      case 602:
        state = WeatherId.snow;
        break;
      case 611:
        state = WeatherId.snow;
        break;
      case 612:
        state = WeatherId.snow;
        break;
      case 613:
        state = WeatherId.snow;
        break;
      case 615:
        state = WeatherId.snow;
        break;
      case 616:
        state = WeatherId.snow;
        break;
      case 620:
        state = WeatherId.snow;
        break;
      case 621:
        state = WeatherId.snow;
        break;
      case 622:
        state = WeatherId.snow;
        break;
      case 701:
        state = WeatherId.atmosphere;
        break;
      case 711:
        state = WeatherId.atmosphere;
        break;
      case 721:
        state = WeatherId.atmosphere;
        break;
      case 731:
        state = WeatherId.atmosphere;
        break;
      case 741:
        state = WeatherId.atmosphere;
        break;
      case 751:
        state = WeatherId.atmosphere;
        break;
      case 761:
        state = WeatherId.atmosphere;
        break;
      case 762:
        state = WeatherId.atmosphere;
        break;
      case 771:
        state = WeatherId.atmosphere;
        break;
      case 781:
        state = WeatherId.atmosphere;
        break;
      case 800:
        state = WeatherId.clear;
        break;
      case 801:
        state = WeatherId.clouds;
        break;
      case 802:
        state = WeatherId.clouds;
        break;
      case 803:
        state = WeatherId.clouds;
        break;
      case 804:
        state = WeatherId.clouds;
        break;
      default:
        state = WeatherId.unknown;
    }
    return state;
  }
}

class CurrentWeather extends Equatable {
  final num dt;
  final num sunrise;
  final num sunset;
  final double temp;
  final num feelsLike;
  final num pressure;
  final num humidity;
  final num windSpeed;
  final num windDeg;
  final Weather weather;

  const CurrentWeather ({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
  });

  @override
  List<Object?> get props => [
    dt,
    sunrise,
    sunset,
    temp,
    feelsLike,
    pressure,
    humidity,
    windSpeed,
    windDeg,
    weather,
  ];

  static CurrentWeather fromJson(dynamic currentWeather) {
    return CurrentWeather(
      dt: currentWeather['dt'] as num,
      sunrise: currentWeather['sunrise'] as num,
      sunset: currentWeather['sunset'] as num,
      temp: currentWeather['temp'] as double,
      feelsLike: currentWeather['feels_like'] as num,
      pressure: currentWeather['pressure'] as num,
      humidity: currentWeather['humidity'] as num,
      windSpeed: currentWeather['wind_speed'] as num,
      windDeg: currentWeather['wind_deg'] as num,
      weather: Weather.fromJson(currentWeather['weather']),
    );
  }
}

class OpenWeather extends Equatable {
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final CurrentWeather currentWeather;
  final DateTime lastUpdated;

  const OpenWeather({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.currentWeather,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
    lat,
    lon,
    timezone,
    timezoneOffset,
    currentWeather,
    lastUpdated,
  ];

  static OpenWeather fromJson(dynamic json) {
      return OpenWeather(
          lat: json['lat'] as double,
          lon: json['lat'] as double,
          timezone: json['timezone'].toString(),
          timezoneOffset: json['timezone_offset'] as int,
          currentWeather: CurrentWeather.fromJson(json['current']),
          lastUpdated: DateTime.now(),
      );
  }
}

class Location extends Equatable {
final String name;
final double lat;
final double lon;

const Location ({
  required this.name,
  required this.lat,
  required this.lon,
});

  @override
  List<Object?> get props => [
    name,
    lat,
    lon
  ];

  static Location fromJson(dynamic json) {
    return Location(
      name: json['name'],
      lat: json['lat'],
      lon: json['lon'],
    );
  }

}