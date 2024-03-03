// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => WeatherInfo(
      weather: (json['weather'] as List<dynamic>)
          .map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: TemperatureInfo.fromJson(json['main'] as Map<String, dynamic>),
    );

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      main: json['main'] as String,
      description: json['description'] as String,
    );

TemperatureInfo _$TemperatureInfoFromJson(Map<String, dynamic> json) =>
    TemperatureInfo(
      temp: (json['temp'] as num).toDouble(),
      feelsLike: (json['feels_like'] as num).toDouble(),
    );
