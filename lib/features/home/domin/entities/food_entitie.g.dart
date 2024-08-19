// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entitie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodEntitieAdapter extends TypeAdapter<FoodEntitie> {
  @override
  final int typeId = 1;

  @override
  FoodEntitie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodEntitie(
      foodImage: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as num,
      Rating: fields[3] as num,
      ingredients: (fields[4] as List?)?.cast<String>(),
      kCal: fields[5] as num,
      grams: fields[6] as num,
      description: fields[7] as String,
      proteins: fields[8] as num,
      fats: fields[9] as num,
      carbs: fields[10] as num,
      number: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FoodEntitie obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.foodImage)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.Rating)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.kCal)
      ..writeByte(6)
      ..write(obj.grams)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.proteins)
      ..writeByte(9)
      ..write(obj.fats)
      ..writeByte(10)
      ..write(obj.carbs)
      ..writeByte(11)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodEntitieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
