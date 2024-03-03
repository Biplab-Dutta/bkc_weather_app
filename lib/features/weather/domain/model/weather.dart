import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class WeatherInfo extends Equatable {
  const WeatherInfo({
    required this.weather,
    required this.main,
  });

  final List<Weather> weather;
  final TemperatureInfo main;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return _$WeatherInfoFromJson(json);
  }

  @override
  List<Object> get props => [weather, main];
}

@JsonSerializable(createToJson: false)
class Weather extends Equatable {
  const Weather({
    required this.main,
    required this.description,
  });

  final String main;
  final String description;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return _$WeatherFromJson(json);
  }

  @override
  List<Object?> get props => [main, description];
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TemperatureInfo extends Equatable {
  const TemperatureInfo({
    required this.temp,
    required this.feelsLike,
  });

  final double temp;
  final double feelsLike;

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    return _$TemperatureInfoFromJson(json);
  }

  @override
  List<Object> get props => [temp, feelsLike];
}
