// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocationModelAdapter extends TypeAdapter<LocationModel> {
  @override
  final int typeId = 1;

  @override
  LocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocationModel(
      latitude: fields[0] as double,
      longitude: fields[1] as double,
      accuracy: fields[2] as double,
      altitude: fields[3] as double,
      speed: fields[4] as double,
      speedAccuracy: fields[5] as double,
      heading: fields[6] as double,
      time: fields[7] as double,
      isMock: fields[8] as bool,
      city: fields[9] as CityModel,
    );
  }

  @override
  void write(BinaryWriter writer, LocationModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude)
      ..writeByte(2)
      ..write(obj.accuracy)
      ..writeByte(3)
      ..write(obj.altitude)
      ..writeByte(4)
      ..write(obj.speed)
      ..writeByte(5)
      ..write(obj.speedAccuracy)
      ..writeByte(6)
      ..write(obj.heading)
      ..writeByte(7)
      ..write(obj.time)
      ..writeByte(8)
      ..write(obj.isMock)
      ..writeByte(9)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
