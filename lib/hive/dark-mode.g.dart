// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark-mode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DarkModeAdapter extends TypeAdapter<DarkMode> {
  @override
  final int typeId = 1;

  @override
  DarkMode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DarkMode(
      isDarkTheme: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DarkMode obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDarkTheme);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DarkModeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
