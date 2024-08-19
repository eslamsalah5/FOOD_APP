import 'package:flutter/material.dart';
import 'package:food_app/models/ingredients_model.dart';
import 'package:food_app/core/utils/constants.dart';

class IngredientsItem extends StatelessWidget {
  final String ingredientName;
  const IngredientsItem({
    super.key,
    required this.ingredientName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          color: Colors.white),
      child: Column(
        children: [
          // Image.asset(
          //   ingredients.image,
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          SizedBox(
            width: 90,
            child: Text(
              ingredientName,
              style: const TextStyle(
                fontSize: headLineFont3,
                fontWeight: FontWeight.w600,
                color: Color(0xFF666687),
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
