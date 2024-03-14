import 'package:geolocator/geolocator.dart';

class LocationServiceDisabledException implements Exception {}

class LocationPermissionDeniedException implements Exception {}

class Location {
  Future<(double, double)> getPosition() async {
    final isLocationServiceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      throw LocationServiceDisabledException();
    }

    final permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      throw LocationPermissionDeniedException();
    } else {
      final position = await Geolocator.getCurrentPosition();
      return (position.latitude, position.longitude);
    }
  }
}
