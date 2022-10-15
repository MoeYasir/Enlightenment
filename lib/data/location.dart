import 'package:geolocator/geolocator.dart';

class Location {

  Future<Position> getCurrentPosition() async {
    var state = await getLocationPermissionState();
    if(state == LocationPermission.denied) {
      await askForLocationPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<LocationPermission> askForLocationPermission() async {
    return await Geolocator.requestPermission();
  }

  Future<LocationPermission> getLocationPermissionState() async {
    return await Geolocator.checkPermission();
  }

  Future<double> getDistance(double patientLongitude, double patientLatitude, double serviceProviderLongitude, double serviceProviderLatitude) async {
    return Geolocator.distanceBetween(patientLatitude, patientLongitude, serviceProviderLatitude, serviceProviderLongitude) / 1000;
  }
}