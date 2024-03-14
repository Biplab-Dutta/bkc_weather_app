// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, loaded, error }

class WeatherState extends Equatable {
  const WeatherState({
    this.status = WeatherStatus.initial,
    this.weather,
  });

  final WeatherStatus status;
  final WeatherInfo? weather;

  @override
  List<Object?> get props => [status, weather];

  WeatherState copyWith({
    WeatherStatus Function()? status,
    WeatherInfo? Function()? weather,
  }) {
    return WeatherState(
      status: status != null ? status() : this.status,
      weather: weather != null ? weather() : this.weather,
    );
  }
}
