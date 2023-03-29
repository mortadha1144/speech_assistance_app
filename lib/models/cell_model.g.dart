// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cell_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CellModelAdapter extends TypeAdapter<CellModel> {
  @override
  final int typeId = 0;

  @override
  CellModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CellModel(
      date: fields[0] as DateTime,
      text: fields[1] as String,
      isCell: fields[2] as bool,
      isPinned: fields[3] as bool,
      pinningSerial: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CellModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isCell)
      ..writeByte(3)
      ..write(obj.isPinned)
      ..writeByte(4)
      ..write(obj.pinningSerial);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CellModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
