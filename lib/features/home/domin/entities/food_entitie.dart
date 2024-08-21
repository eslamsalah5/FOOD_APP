import 'package:hive/hive.dart';

part 'food_entitie.g.dart';

@HiveType(typeId: 1)
class FoodEntitie extends HiveObject {
  @HiveField(0)
  final String foodImage;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final num price;
  @HiveField(3)
  final num Rating;
  @HiveField(4)
  final List<String>? ingredients;
  @HiveField(5)
  final num kCal;
  @HiveField(6)
  final num grams;
  @HiveField(7)
  final String description;
  @HiveField(8)
  final num proteins;
  @HiveField(9)
  final num fats;
  @HiveField(10)
  final num carbs;
  @HiveField(11)
  int number;
  @HiveField(12)
  num? foodId;

  FoodEntitie({
    required this.foodImage,
    required this.name,
    required this.price,
    required this.Rating,
    required this.ingredients,
    required this.kCal,
    required this.grams,
    required this.description,
    required this.proteins,
    required this.fats,
    required this.carbs,
    required this.number,
    required this.foodId,
  });
}
