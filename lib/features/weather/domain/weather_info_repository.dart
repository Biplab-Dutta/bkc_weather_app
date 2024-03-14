import 'package:weather_app/features/weather/domain/model/weather.dart';

abstract interface class WeatherInfoRepository {
  Future<WeatherInfo> getCurrentWeather({
    required double lat,
    required double lon,
  });
}
