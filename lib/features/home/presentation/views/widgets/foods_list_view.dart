import 'package:flutter/material.dart';
import 'package:food_app/features/home/domin/entities/food_entitie.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_container_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/rating_item.dart';

class FoodsListView extends StatelessWidget {
  final List<FoodEntitie> foodList;
  const FoodsListView({
    super.key,
    required this.foodList,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 180, maxHeight: 200),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(end: 8.0),
                  child: FoodContainerItem(
                    food: foodList[index],
                    ratingItem: RatingItem(
                      rating: foodList[index].Rating.round(),
                    ),
                  ),
                ),
            itemCount: foodList.length),
      ),
    );
  }
}
