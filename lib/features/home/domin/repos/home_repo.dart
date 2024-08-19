import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<CategoryEntitie>>> fetchCategories();
  Future<Either<Failures, List<FoodEntitie>>> fetchPopularFood();
  Future<Either<Failures, List<FoodEntitie>>> fetchBreakFastFood();
  Future<Either<Failures, List<FoodEntitie>>> fetchAppetizerFood();
  Future<Either<Failures, List<FoodEntitie>>> fetchBeefFood();
  Future<Either<Failures, void>> AddOrder(FoodEntitie foodEntitie);
}
