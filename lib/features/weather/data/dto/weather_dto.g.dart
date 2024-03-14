// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoDto _$WeatherInfoDtoFromJson(Map<String, dynamic> json) =>
    WeatherInfoDto(
      weatherDto: (json['weather'] as List<dynamic>)
          .map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainDto:
          TemperatureInfoDto.fromJson(json['main'] as Map<String, dynamic>),
    );

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      main: json['main'] as String,
      description: json['description'] as String,
    );

TemperatureInfoDto _$TemperatureInfoDtoFromJson(Map<String, dynamic> json) =>
    TemperatureInfoDto(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );
