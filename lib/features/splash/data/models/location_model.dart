import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'city_model.dart';

part 'location_model.g.dart'; // Add this line

@HiveType(typeId: 1)
class LocationModel extends HiveObject {
  @HiveField(0)
  final double latitude;

  @HiveField(1)
  final double longitude;

  @HiveField(2)
  final double accuracy;

  @HiveField(3)
  final double altitude;

  @HiveField(4)
  final double speed;

  @HiveField(5)
  final double speedAccuracy;

  @HiveField(6)
  final double heading;

  @HiveField(7)
  final double time;

  @HiveField(8)
  final bool isMock;

  @HiveField(9)
  final CityModel city;

  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.accuracy,
    required this.altitude,
    required this.speed,
    required this.speedAccuracy,
    required this.heading,
    required this.time,
    required this.isMock,
    required this.city,
  });
  factory LocationModel.fromPosition(Position position, CityModel city) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
      accuracy: position.accuracy,
      altitude: position.altitude,
      speed: position.speed,
      speedAccuracy: position.speedAccuracy,
      heading: position.heading,
      time: position.timestamp.millisecondsSinceEpoch.toDouble(),
      isMock: position.isMocked,
      city: city,
    );
  }
  factory LocationModel.stander() {
    return LocationModel(
      latitude: 37.7749,
      longitude: -122.4194,
      accuracy: 10.0,
      altitude: 50.0,
      speed: 5.0,
      speedAccuracy: 0.0,
      heading: 90.0,
      time: DateTime.now().millisecondsSinceEpoch.toDouble(),
      isMock: true,
      city: CityModel.stander(),
    );
  }

  factory LocationModel.fromJson(Map<String, dynamic> json, CityModel city) {
    return LocationModel(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      accuracy: json['accuracy'] as double,
      altitude: json['altitude'] as double,
      speed: json['speed'] as double,
      speedAccuracy: json['speedAccuracy'] as double,
      heading: json['heading'] as double,
      time: json['time'] as double,
      isMock: json['isMock'] as bool,
      city: city,
    );
  }
}
