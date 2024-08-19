// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entitie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryEntitieAdapter extends TypeAdapter<CategoryEntitie> {
  @override
  final int typeId = 0;

  @override
  CategoryEntitie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryEntitie(
      categoryId: fields[2] as int,
      image: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryEntitie obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryEntitieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
