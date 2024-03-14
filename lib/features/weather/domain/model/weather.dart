import 'package:equatable/equatable.dart';

class WeatherInfo extends Equatable {
  const WeatherInfo({
    required this.weather,
    required this.main,
  });

  final List<Weather> weather;
  final TemperatureInfo main;

  @override
  List<Object?> get props => [weather, main];
}

class Weather extends Equatable {
  const Weather({
    required this.main,
    required this.description,
  });

  final String main;
  final String description;

  @override
  List<Object?> get props => [main, description];
}

class TemperatureInfo extends Equatable {
  const TemperatureInfo({
    required this.temp,
    required this.feelsLike,
  });

  final double temp;
  final double feelsLike;

  @override
  List<Object?> get props => [temp, feelsLike];
}
