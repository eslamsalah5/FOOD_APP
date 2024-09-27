import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/search/data/data_source/search_remote_data_source.dart';
import 'package:food_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({required this.searchRemoteDataSource});
  @override
  Future<Either<Failures, List<FoodEntitie>>> fetchSearchedFood(
      {required String searchWord}) async {
    List<FoodEntitie> foodList = [];

    try {
      foodList = await searchRemoteDataSource.fetchSearchedFood(
          searchWord: searchWord);
      return right(foodList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
