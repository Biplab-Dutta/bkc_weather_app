import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/geolocation/location.dart';
import 'package:weather_app/features/weather/domain/weather_info_usecase.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class WeatherInfoPage extends StatefulWidget {
  const WeatherInfoPage({super.key});

  @override
  State<WeatherInfoPage> createState() => _WeatherInfoPageState();
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  late final Future<(double, double)> position;

  @override
  void initState() {
    super.initState();
    final location = Location();
    position = location.getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Page')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();

            if (snapshot.hasError) {
              return const Text('Something went wrong!');
            }

            final lat = snapshot.data!.$1;
            final lon = snapshot.data!.$2;

            return BlocProvider(
              create: (_) => WeatherBloc(usecase: GetWeatherUsecase())
                ..add(CurrentWeatherFetchedEvent(lat: lat, lon: lon)),
              child: const WeatherDisplay(),
            );
          },
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  const WeatherDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return switch (state.status) {
          WeatherStatus.initial => const SizedBox.shrink(),
          WeatherStatus.loading => const CircularProgressIndicator(),
          WeatherStatus.error => const Text('Oops. An error occured!'),
          WeatherStatus.loaded => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Temperature: ${state.weather!.main.temp}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description:  ${state.weather!.weather[0].description}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  'Feels like: ${state.weather!.main.feelsLike}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
        };
      },
    );
  }
}
