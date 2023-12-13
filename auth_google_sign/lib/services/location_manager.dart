import 'package:geolocator/geolocator.dart';

class LocationManager {
  Future<Position> start() async {
    final bool locationEnabled = await Geolocator.isLocationServiceEnabled();
    return (locationEnabled)
        ? await handlePermission()
        : await errorString('Location service is disabled');
  }

  Future<Position> handlePermission() async {
    final LocationPermission locationPermission =
        await Geolocator.checkPermission();
    return await resultPermission(locationPermission);
  }

  Future<Position> resultPermission(
      LocationPermission locationPermission) async {
    switch (locationPermission) {
      case LocationPermission.denied:
        return request()
            .then((newPermission) => resultPermission(newPermission));

      case LocationPermission.deniedForever:
        return errorString('Location permission denied forever');

      case LocationPermission.whileInUse:
        return await getPosition();

      case LocationPermission.unableToDetermine:
        return request()
            .then((newPermission) => resultPermission(newPermission));

      case LocationPermission.always:
        return await getPosition();
    }
  }

  Future<Position> getPosition() async => await Geolocator.getCurrentPosition();

  Future<Position> errorString(String err) async => await Future.error(err);

  Future<LocationPermission> request() async =>
      await Geolocator.requestPermission();
}
