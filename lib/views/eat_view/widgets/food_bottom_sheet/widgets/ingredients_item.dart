import 'package:flutter/material.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/shared/constants/constants.dart';

class IngredientsItem extends StatelessWidget {
  final IngredientsModel ingredients;
  const IngredientsItem({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      width: 92,
      height: 74,
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: Colors.white),
      child: Column(
        children: [
          Image.asset(
            ingredients.image,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            ingredients.name,
            style: const TextStyle(
              fontSize: headLineFont3,
              fontWeight: FontWeight.w600,
              color: Color(0xFF666687),
            ),
          ),
        ],
      ),
    );
  }
}
