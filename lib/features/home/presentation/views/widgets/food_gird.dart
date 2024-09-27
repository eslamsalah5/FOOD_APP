import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/grid_food_container_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/grid_rating_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/rating_item.dart';

class FoodGird extends StatelessWidget {
  final List<FoodEntitie> foodList;
  const FoodGird({super.key, required this.foodList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 12,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 8.0),
              child: GridFoodContainerItem(
                food: foodList[index],
                ratingItem: GridRatingItem(
                  rating: foodList[index].Rating.round(),
                ),
              ),
            ),
        itemCount: foodList.length);
  }
}
