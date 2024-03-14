part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class CurrentWeatherFetchedEvent extends WeatherEvent {
  const CurrentWeatherFetchedEvent({
    required this.lat,
    required this.lon,
  });

  final double lat, lon;
}
