// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityAdapter extends TypeAdapter<_$_Activity> {
  @override
  final int typeId = 0;

  @override
  _$_Activity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Activity(
      id: fields[0] as int?,
      day: fields[1] as int,
      month: fields[2] as int,
      year: fields[3] as int,
      moodId: fields[4] as int?,
      title: fields[5] as String?,
      note: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Activity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.day)
      ..writeByte(2)
      ..write(obj.month)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.moodId)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
