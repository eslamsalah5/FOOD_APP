import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/appetizer_food_list_view_bloc_builder.dart';

class AppetizerSection extends StatelessWidget {
  const AppetizerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Appetizer and Snacks',
            style: TextStyle(
              color: Color(0xFF666687),
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppetizerFoodListViewBlocBuilder(),
            SizedBox(height: 20),
        ],
      ),
    );
  }
}
