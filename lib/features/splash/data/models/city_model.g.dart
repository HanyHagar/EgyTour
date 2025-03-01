// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityModelAdapter extends TypeAdapter<CityModel> {
  @override
  final int typeId = 2;

  @override
  CityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityModel(
      country: fields[0] as String,
      state: fields[1] as String,
      city: fields[2] as String,
      street: fields[3] as String,
      postalCode: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CityModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.state)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.street)
      ..writeByte(4)
      ..write(obj.postalCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
