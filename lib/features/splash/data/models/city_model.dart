import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hive/hive.dart';

part 'city_model.g.dart'; // Add this line

@HiveType(typeId: 2)
class CityModel extends HiveObject {
  @HiveField(0)
  final String country;

  @HiveField(1)
  final String state;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String street;

  @HiveField(4)
  final String postalCode;

  CityModel({
    required this.country,
    required this.state,
    required this.city,
    required this.street,
    required this.postalCode,
  });
  factory CityModel.fromPlacemark(Placemark placemark) {
    return CityModel(
      country: placemark.country ?? "Unknown",
      state: placemark.administrativeArea ?? "Unknown",
      city: placemark.locality ?? "Unknown",
      street: placemark.street ?? "Unknown",
      postalCode: placemark.postalCode ?? "Unknown",
    );
  }

  factory CityModel.fromAddress(Address address) {
    return CityModel(
      country: address.countryName ?? "Unknown",
      state: address.region ?? "Unknown",
      city: address.city ?? "Unknown",
      street: address.streetAddress ?? "Unknown",
      postalCode: address.postal ?? "Unknown",
    );
  }

  factory CityModel.stander() {
    return CityModel(
      country: 'United States',
      state: 'California',
      city: 'San Francisco',
      street: 'Market Street',
      postalCode: '94105',
    );
  }
}
