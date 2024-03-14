import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/exceptions.dart';
import 'package:weather_app/features/weather/domain/model/weather.dart';
import 'package:weather_app/features/weather/domain/weather_info_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required this.usecase,
  }) : super(const WeatherState()) {
    on<CurrentWeatherFetchedEvent>(
      (event, emit) async {
        emit(state.copyWith(status: () => WeatherStatus.loading));
        try {
          final currentWeather = await usecase.getCurrentWeather(
            lat: event.lat,
            lon: event.lon,
          );

          emit(
            state.copyWith(
              status: () => WeatherStatus.loaded,
              weather: () => currentWeather,
            ),
          );
        } on InvalidRequestException catch (_) {
          emit(
            state.copyWith(
              status: () => WeatherStatus.error,
              weather: () => null,
            ),
          );
        } on NoInternetException catch (_) {
          emit(
            state.copyWith(
              status: () => WeatherStatus.error,
              weather: () => null,
            ),
          );
        }
      },
    );
  }

  final GetWeatherUsecase usecase;
}
