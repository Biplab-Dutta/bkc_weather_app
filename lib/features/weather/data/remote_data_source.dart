import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:weather_app/features/weather/domain/model/weather.dart';
import 'package:weather_app/secrets.dart';

class InvalidRequestException implements Exception {}

class NoInternetException implements Exception {}

abstract interface class WeatherRemoteDataSource {
  Future<WeatherInfo> fetchWeather({
    required double lat,
    required double lon,
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  @override
  Future<WeatherInfo> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    try {
      final weatherApiUrl = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {
          'lat': lat.toString(),
          'lon': lon.toString(),
          'appid': appid,
        },
      );
      final response = await http.get(weatherApiUrl);
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body) as Map<String, dynamic>;
        return WeatherInfo.fromJson(result);
      } else {
        throw InvalidRequestException();
      }
    } on SocketException catch (_) {
      throw NoInternetException();
    }
  }
}
