import 'package:food_app/core/utils/dio_helper.dart';
import 'package:food_app/features/home/data/models/food_model/food_model.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';

abstract class SearchRemoteDataSource {
  Future<List<FoodEntitie>> fetchSearchedFood({required String searchWord});
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final DioHelper dioHelper;

  SearchRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<FoodEntitie>> fetchSearchedFood(
      {required String searchWord}) async {
    var data = await dioHelper.get(
      endPoint:
          '?search=$searchWord&rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<FoodEntitie> foodList = [];

    foodList = (data as List).map((e) => FoodModel.fromJson(e)).toList();

    return foodList;
  }
}
