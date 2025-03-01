// ignore_for_file: equal_keys_in_map
import 'dart:developer';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

import '../../features/splash/data/models/city_model.dart';
import '../../features/splash/data/models/location_model.dart';



class LocationService {
  Future<LocationModel> getCurrentLocation() async {
    try {
      await _checkAndRequestPermission();

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
        ),
      );

      log("Position: Lat=${position.latitude}, Lng=${position.longitude}");
      Address address = await GeoCode().reverseGeocoding(latitude: position.latitude, longitude: position.longitude);
      var city = CityModel.fromAddress(address);
      log("City :${address.city}");

      // List<Placemark> cityData = await placemarkFromCoordinates(
      //   position.latitude,
      //   position.longitude,
      // );
       // var city = CityModel.fromPlacemark(cityData.first);
      return LocationModel.fromPosition(position, city);
    } catch (e) {
      return Future.error("Error getting location: $e");
    }
  }

  Future<void> _checkAndRequestPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("Location services are disabled. Please enable them.");
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission denied forever. Enable it manually in settings.");
    }
  }
}