import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/utils/dio_helper.dart';
import 'package:food_app/features/home/data/models/food_model/category.dart';
import 'package:food_app/features/home/data/models/food_model/food_model.dart';
import 'package:food_app/features/home/domin/entities/category_entitie.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryEntitie>> fetchCategories();
  Future<List<FoodEntitie>> fetchPopularFood();
  Future<List<FoodEntitie>> fetchAppetizerFood();
  Future<List<FoodEntitie>> fetchBreakFastFood();
  Future<List<FoodEntitie>> fetchBeefFood();

  Future<void> AddOrder(FoodEntitie foodEntitie);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioHelper dioHelper;

  HomeRemoteDataSourceImpl(this.dioHelper);
  @override
  Future<List<CategoryEntitie>> fetchCategories() async {
    var data = await dioHelper.get(
      endPoint:
          'categories/?rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<CategoryEntitie> categoryList = [];

    categoryList = (data as List).map((e) => Category.fromJson(e)).toList();

    debugPrint(categoryList.toString());

    await Hive.box<CategoryEntitie>(kCategoryTitle).addAll(categoryList);
    return categoryList;
  }

  @override
  Future<List<FoodEntitie>> fetchPopularFood() async {
    var data = await dioHelper.get(
      endPoint:
          '?difficulty=Medium&rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<FoodEntitie> foodList = [];

    foodList = (data as List).map((e) => FoodModel.fromJson(e)).toList();

    await Hive.box<FoodEntitie>(kPopularTitle).addAll(foodList);

    return foodList;
  }

  @override
  Future<List<FoodEntitie>> fetchAppetizerFood() async {
    var data = await dioHelper.get(
      endPoint:
          '?category=2&rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<FoodEntitie> foodList = [];

    foodList = (data as List).map((e) => FoodModel.fromJson(e)).toList();

    await Hive.box<FoodEntitie>(kAppetizerTitle).addAll(foodList);

    return foodList;
  }

  @override
  Future<List<FoodEntitie>> fetchBreakFastFood() async {
    var data = await dioHelper.get(
      endPoint:
          '?category=1&rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<FoodEntitie> foodList = [];

    foodList = (data as List).map((e) => FoodModel.fromJson(e)).toList();

    await Hive.box<FoodEntitie>(kBreakFastTitle).addAll(foodList);

    return foodList;
  }

  @override
  Future<List<FoodEntitie>> fetchBeefFood() async {
    var data = await dioHelper.get(
      endPoint:
          '?category=3&rapidapi-key=b409cb21c1msh29867ca0d1c2ff4p1d6e76jsndc2a54ae358d',
    );

    List<FoodEntitie> foodList = [];

    foodList = (data as List).map((e) => FoodModel.fromJson(e)).toList();

    await Hive.box<FoodEntitie>(kBeefTitle).addAll(foodList);

    return foodList;
  }

  //add order

  @override
  Future<void> AddOrder(FoodEntitie foodEntitie) async {
    try {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('orders')
          .doc(foodEntitie.foodId.toString())
          .set({
        'name': foodEntitie.name,
        'price': foodEntitie.price,
        'image': foodEntitie.foodImage,
        'quantity': foodEntitie.number,
        'total': foodEntitie.price * foodEntitie.number,
        'rating': foodEntitie.Rating,
        'id': foodEntitie.foodId,
        'currency': 'USD',
      });
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
