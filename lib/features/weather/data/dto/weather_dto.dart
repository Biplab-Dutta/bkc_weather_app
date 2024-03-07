import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable(explicitToJson: true, createToJson: false)
class WeatherInfoDto extends Equatable {
  const WeatherInfoDto({
    required this.weather,
    required this.main,
  });

  final List<WeatherDto> weather;
  final TemperatureInfoDto main;

  factory WeatherInfoDto.fromJson(Map<String, dynamic> json) {
    return _$WeatherInfoDtoFromJson(json);
  }

  @override
  List<Object> get props => [weather, main];
}

@JsonSerializable(createToJson: false)
class WeatherDto extends Equatable {
  const WeatherDto({
    required this.main,
    required this.description,
  });

  final String main;
  final String description;

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return _$WeatherDtoFromJson(json);
  }

  @override
  List<Object?> get props => [main, description];
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class TemperatureInfoDto extends Equatable {
  const TemperatureInfoDto({
    required this.temp,
    required this.feelsLike,
  });

  final double temp;
  final double feelsLike;

  factory TemperatureInfoDto.fromJson(Map<String, dynamic> json) {
    return _$TemperatureInfoDtoFromJson(json);
  }

  @override
  List<Object> get props => [temp, feelsLike];
}
