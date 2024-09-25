import 'dart:math';

import 'package:food_app/features/home/domin/entities/food_entitie.dart';

import 'category.dart';

class FoodModel extends FoodEntitie {
  num? id;
  String? recipe;
  Category? category;
  num? prepTimeInMinutes;
  dynamic prepTimeNote;
  num? cookTimeInMinutes;
  dynamic cookTimeNote;
  String? difficulty;
  num? serving;
  num? measurement1;
  num? measurement2;
  num? measurement3;
  num? measurement4;
  dynamic measurement5;
  dynamic measurement6;
  dynamic measurement7;
  dynamic measurement8;
  dynamic measurement9;
  dynamic measurement10;
  String? ingredient1;
  String? ingredient2;
  String? ingredient3;
  String? ingredient4;
  dynamic ingredient5;
  dynamic ingredient6;
  dynamic ingredient7;
  dynamic ingredient8;
  dynamic ingredient9;
  dynamic ingredient10;
  String? directionsStep1;
  String? directionsStep2;
  String? directionsStep3;
  String? directionsStep4;
  String? directionsStep5;
  String? directionsStep6;
  String? image;
  dynamic imageAttributionName;
  dynamic imageAttributionUrl;
  bool? imageCreativeCommons;
  num? calories;
  num? fatInGrams;
  num? carbohydratesInGrams;
  num? proteinInGrams;

  FoodModel({
    this.id,
    this.recipe,
    this.category,
    this.prepTimeInMinutes,
    this.prepTimeNote,
    this.cookTimeInMinutes,
    this.cookTimeNote,
    this.difficulty,
    this.serving,
    this.measurement1,
    this.measurement2,
    this.measurement3,
    this.measurement4,
    this.measurement5,
    this.measurement6,
    this.measurement7,
    this.measurement8,
    this.measurement9,
    this.measurement10,
    this.ingredient1,
    this.ingredient2,
    this.ingredient3,
    this.ingredient4,
    this.ingredient5,
    this.ingredient6,
    this.ingredient7,
    this.ingredient8,
    this.ingredient9,
    this.ingredient10,
    this.directionsStep1,
    this.directionsStep2,
    this.directionsStep3,
    this.directionsStep4,
    this.directionsStep5,
    this.directionsStep6,
    this.image,
    this.imageAttributionName,
    this.imageAttributionUrl,
    this.imageCreativeCommons,
    this.calories,
    this.fatInGrams,
    this.carbohydratesInGrams,
    this.proteinInGrams,
  }) : super(
            foodImage: image ?? '',
            name: recipe!,
            price: Random().nextInt(100) + 50,
            Rating: Random().nextDouble() * 4 + 1.0,
            carbs: carbohydratesInGrams ?? 0,
            description: recipe,
            kCal: calories ?? 0,
            grams: (carbohydratesInGrams ?? 0) + (fatInGrams ?? 0) + (proteinInGrams ?? 0),
            ingredients: [
              ingredient1 ?? '',
              ingredient2 ?? '',
              ingredient3 ?? '',
              ingredient4 ?? ''
            ],
            fats: fatInGrams ?? 0,
            number: 1,
            foodId: id!,
            proteins: proteinInGrams ?? 0);

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'] as num?,
        recipe: json['recipe'] as String?,
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        prepTimeInMinutes: json['prep_time_in_minutes'] as num?,
        prepTimeNote: json['prep_time_note'] as dynamic,
        cookTimeInMinutes: json['cook_time_in_minutes'] as num?,
        cookTimeNote: json['cook_time_note'] as dynamic,
        difficulty: json['difficulty'] as String?,
        serving: json['serving'] as num?,
        measurement1: json['measurement_1'] as num?,
        measurement2: json['measurement_2'] as num?,
        measurement3: json['measurement_3'] as num?,
        measurement4: json['measurement_4'] as num?,
        measurement5: json['measurement_5'] as dynamic,
        measurement6: json['measurement_6'] as dynamic,
        measurement7: json['measurement_7'] as dynamic,
        measurement8: json['measurement_8'] as dynamic,
        measurement9: json['measurement_9'] as dynamic,
        measurement10: json['measurement_10'] as dynamic,
        ingredient1: json['ingredient_1'] as String?,
        ingredient2: json['ingredient_2'] as String?,
        ingredient3: json['ingredient_3'] as String?,
        ingredient4: json['ingredient_4'] as String?,
        ingredient5: json['ingredient_5'] as dynamic,
        ingredient6: json['ingredient_6'] as dynamic,
        ingredient7: json['ingredient_7'] as dynamic,
        ingredient8: json['ingredient_8'] as dynamic,
        ingredient9: json['ingredient_9'] as dynamic,
        ingredient10: json['ingredient_10'] as dynamic,
        directionsStep1: json['directions_step_1'] as String?,
        directionsStep2: json['directions_step_2'] as String?,
        directionsStep3: json['directions_step_3'] as String?,
        directionsStep4: json['directions_step_4'] as String?,
        directionsStep5: json['directions_step_5'] as String?,
        directionsStep6: json['directions_step_6'] as String?,
        image: json['image'] as String?,
        imageAttributionName: json['image_attribution_name'] as dynamic,
        imageAttributionUrl: json['image_attribution_url'] as dynamic,
        imageCreativeCommons: json['image_creative_commons'] as bool?,
        calories: json['calories'] as num?,
        fatInGrams: json['fat_in_grams'] as num?,
        carbohydratesInGrams: json['carbohydrates_in_grams'] as num?,
        proteinInGrams: json['protein_in_grams'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'recipe': recipe,
        'category': category?.toJson(),
        'prep_time_in_minutes': prepTimeInMinutes,
        'prep_time_note': prepTimeNote,
        'cook_time_in_minutes': cookTimeInMinutes,
        'cook_time_note': cookTimeNote,
        'difficulty': difficulty,
        'serving': serving,
        'image': image,
        'measurement_1': measurement1,
        'measurement_2': measurement2,
        'measurement_3': measurement3,
        'measurement_4': measurement4,
        'measurement_5': measurement5,
        'measurement_6': measurement6,
        'measurement_7': measurement7,
        'measurement_8': measurement8,
        'measurement_9': measurement9,
        'measurement_10': measurement10,
        'ingredient_1': ingredient1,
        'ingredient_2': ingredient2,
        'ingredient_3': ingredient3,
        'ingredient_4': ingredient4,
        'ingredient_5': ingredient5,
        'ingredient_6': ingredient6,
        'ingredient_7': ingredient7,
        'ingredient_8': ingredient8,
        'ingredient_9': ingredient9,
        'ingredient_10': ingredient10,
        'directions_step_1': directionsStep1,
        'directions_step_2': directionsStep2,
        'directions_step_3': directionsStep3,
        'directions_step_4': directionsStep4,
        'directions_step_5': directionsStep5,
        'directions_step_6': directionsStep6,
        'image': image,
        'image_attribution_name': imageAttributionName,
        'image_attribution_url': imageAttributionUrl,
        'image_creative_commons': imageCreativeCommons,
        'calories': calories,
        'fat_in_grams': fatInGrams,
        'carbohydrates_in_grams': carbohydratesInGrams,
        'protein_in_grams': proteinInGrams,
      };
}
