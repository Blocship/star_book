// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/streak.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StreakDataTypeAdapter extends TypeAdapter<StreakDataType> {
  @override
  final int typeId = 4;

  @override
  StreakDataType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StreakDataType(
      fields[0] as int,
      fields[1] as DateTime,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, StreakDataType obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.streakCount)
      ..writeByte(1)
      ..write(obj.streakStartDate)
      ..writeByte(2)
      ..write(obj.streakEndDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StreakDataTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
