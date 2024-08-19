import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<CategoryEntitie> fetchCategories();
  List<FoodEntitie> fetchPopularFood();
  List<FoodEntitie> fetchAppetizerFood();
  List<FoodEntitie> fetchBreakFastFood();
  List<FoodEntitie> fetchBeefFood();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<CategoryEntitie> fetchCategories() {
    List<CategoryEntitie> categories =
        Hive.box<CategoryEntitie>(kCategoryTitle).values.toList();
    return categories;
  }

  @override
  List<FoodEntitie> fetchPopularFood() {
    List<FoodEntitie> popularFood =
        Hive.box<FoodEntitie>(kPopularTitle).values.toList();
    return popularFood;
  }

  @override
  List<FoodEntitie> fetchAppetizerFood() {
    List<FoodEntitie> appetizerFood =
        Hive.box<FoodEntitie>(kAppetizerTitle).values.toList();
    return appetizerFood;
  }

  @override
  List<FoodEntitie> fetchBreakFastFood() {
    List<FoodEntitie> breakFastFood =
        Hive.box<FoodEntitie>(kBreakFastTitle).values.toList();
    return breakFastFood;
  }

  @override
  List<FoodEntitie> fetchBeefFood() {
    List<FoodEntitie> BeefFastFood =
        Hive.box<FoodEntitie>(kBeefTitle).values.toList();
    return BeefFastFood;
  }
}
