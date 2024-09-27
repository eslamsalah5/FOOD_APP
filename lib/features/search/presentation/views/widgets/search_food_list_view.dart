import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/search/presentation/views/widgets/search_food_item.dart';

class SearchFoodListView extends StatelessWidget {
  const SearchFoodListView({
    super.key,
    required this.foodList,
  });

  final List<FoodEntitie> foodList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) => SearchFoodItem(
              food: foodList[index],
            ),
        itemCount: foodList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics());
  }
}
