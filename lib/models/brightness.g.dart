// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brightness.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrightnessOptionAdapter extends TypeAdapter<BrightnessOption> {
  @override
  final int typeId = 3;

  @override
  BrightnessOption read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BrightnessOption.light;
      case 1:
        return BrightnessOption.dark;
      case 2:
        return BrightnessOption.auto;
      default:
        return BrightnessOption.light;
    }
  }

  @override
  void write(BinaryWriter writer, BrightnessOption obj) {
    switch (obj) {
      case BrightnessOption.light:
        writer.writeByte(0);
        break;
      case BrightnessOption.dark:
        writer.writeByte(1);
        break;
      case BrightnessOption.auto:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrightnessOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
