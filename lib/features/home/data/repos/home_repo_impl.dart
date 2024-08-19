import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_app/core/errors/Failure.dart';
import 'package:food_app/features/home/data/data_source/home_local_data_source.dart';
import 'package:food_app/features/home/data/data_source/home_remote_data_source.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/domin/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failures, List<CategoryEntitie>>> fetchCategories() async {
    List<CategoryEntitie> categories;

    categories = homeLocalDataSource.fetchCategories();

    if (categories.isNotEmpty) {
      return right(categories);
    }

    try {
      categories = await homeRemoteDataSource.fetchCategories();
      return right(categories);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodEntitie>>> fetchPopularFood() async {
    List<FoodEntitie> popularFood;

    popularFood = homeLocalDataSource.fetchPopularFood();

    if (popularFood.isNotEmpty) {
      return right(popularFood);
    }

    try {
      popularFood = await homeRemoteDataSource.fetchPopularFood();
      return right(popularFood);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodEntitie>>> fetchAppetizerFood() async {
    List<FoodEntitie> appetizerFood;

    appetizerFood = homeLocalDataSource.fetchAppetizerFood();

    if (appetizerFood.isNotEmpty) {
      return right(appetizerFood);
    }

    try {
      appetizerFood = await homeRemoteDataSource.fetchAppetizerFood();
      return right(appetizerFood);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodEntitie>>> fetchBreakFastFood() async {
    List<FoodEntitie> breakFastFood;

    breakFastFood = homeLocalDataSource.fetchBreakFastFood();

    if (breakFastFood.isNotEmpty) {
      return right(breakFastFood);
    }

    try {
      breakFastFood = await homeRemoteDataSource.fetchBreakFastFood();
      return right(breakFastFood);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<FoodEntitie>>> fetchBeefFood() async {
    List<FoodEntitie> BeefFood;

    BeefFood = homeLocalDataSource.fetchBeefFood();

    if (BeefFood.isNotEmpty) {
      return right(BeefFood);
    }

    try {
      BeefFood = await homeRemoteDataSource.fetchBeefFood();
      return right(BeefFood);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, void>> AddOrder(FoodEntitie foodEntitie) async {
    try {
      await homeRemoteDataSource.AddOrder(foodEntitie);
      return right(foodEntitie);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
