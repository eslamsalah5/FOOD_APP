import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/grid_food_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/grid_rating_item.dart';

class GridFoodContainerItem extends StatelessWidget {
  final FoodEntitie food;
  final GridRatingItem ratingItem;
  const GridFoodContainerItem({
    super.key,
    required this.food,
    required this.ratingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridFoodItem(
          food: food,
        ),
        ratingItem
      ],
    );
  }
}
