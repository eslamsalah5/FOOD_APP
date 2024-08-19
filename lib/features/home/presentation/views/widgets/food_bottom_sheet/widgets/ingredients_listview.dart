import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_bottom_sheet/widgets/ingredients_item.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({
    super.key,
    required this.food,
  });

  final FoodEntitie food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) =>
              IngredientsItem(ingredientName: food.ingredients![index]),
          itemCount: food.ingredients!.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 16,
              )),
    );
  }
}
