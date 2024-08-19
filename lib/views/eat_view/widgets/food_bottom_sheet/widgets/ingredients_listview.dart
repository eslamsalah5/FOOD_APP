import 'package:flutter/material.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/views/eat_view/widgets/food_bottom_sheet/widgets/ingredients_item.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({
    super.key,
    required this.ingredients,
  });

  final List<IngredientsModel> ingredients;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            IngredientsItem(ingredients: ingredients[index]),
        itemCount: ingredients.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 16,
            ));
  }
}
