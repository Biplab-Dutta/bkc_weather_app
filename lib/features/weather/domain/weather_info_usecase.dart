import 'package:weather_app/features/weather/data/repository/weather_info_repository_impl.dart';
import 'package:weather_app/features/weather/domain/model/weather.dart';
import 'package:weather_app/features/weather/domain/weather_info_repository.dart';

class GetWeatherUsecase {
  GetWeatherUsecase({
    WeatherInfoRepository? repository,
  }) : _repository = repository ?? WeatherInfoRepositoryImpl();

  final WeatherInfoRepository _repository;

  Future<WeatherInfo> getCurrentWeather({
    required double lat,
    required double lon,
  }) {
    return _repository.getCurrentWeather(lat: lat, lon: lon);
  }
}
