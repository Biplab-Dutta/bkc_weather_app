import 'package:weather_app/features/weather/data/service/weather_info_service.dart';
import 'package:weather_app/features/weather/domain/model/weather.dart';
import 'package:weather_app/features/weather/domain/weather_info_repository.dart';

class WeatherInfoRepositoryImpl implements WeatherInfoRepository {
  WeatherInfoRepositoryImpl({
    WeatherRemoteDataSource? remoteDataSource,
  }) : _remoteDataSource = remoteDataSource ?? WeatherRemoteDataSourceImpl();

  final WeatherRemoteDataSource _remoteDataSource;

  @override
  Future<WeatherInfo> getCurrentWeather({
    required double lat,
    required double lon,
  }) {
    return _remoteDataSource.fetchWeather(lat: lat, lon: lon);
  }
}
