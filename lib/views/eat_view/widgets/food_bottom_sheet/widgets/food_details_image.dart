import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

class FoodDetailsImage extends StatelessWidget {
  const FoodDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade50,
      shape: const CircleBorder(),
      color: backgroundColor,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 1,
      child: Card(
        margin: const EdgeInsets.all(40),
        shape: const CircleBorder(),
        shadowColor: Colors.grey.shade50,
        color: backgroundColor,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 2,
        child: Image.asset('assets/images/avocado sandwich.png'),
      ),
    );
  }
}
