import 'package:dartz/dartz.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<FoodEntitie>>> fetchSearchedFood(
      {required String searchWord});
      
}
