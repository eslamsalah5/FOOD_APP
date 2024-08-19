import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/foods_list_view.dart';
import 'package:food_app/features/home/presentation/views/widgets/rating_item.dart';

class FoodContainerItem extends StatelessWidget {
  final FoodEntitie food;
  final RatingItem ratingItem;
  const FoodContainerItem({
    super.key,
    required this.food,
    required this.ratingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FoodItem(
          food: food,
        ),
        ratingItem
      ],
    );
  }
}
