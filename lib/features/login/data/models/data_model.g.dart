// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataModelAdapter extends TypeAdapter<DataModel> {
  @override
  final int typeId = 4;

  @override
  DataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataModel(
      image: fields[0] as String,
      phone: fields[1] as String,
      name: fields[2] as String,
      id: fields[3] as int,
      credit: fields[4] as int,
      email: fields[5] as String,
      points: fields[6] as int,
      token: fields[7] as String,
      password: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.credit)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.points)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
