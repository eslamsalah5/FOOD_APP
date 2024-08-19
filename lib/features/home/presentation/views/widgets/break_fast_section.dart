import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/break_fast_food_list_view_bloc_builder.dart';

class BreakFastSection extends StatelessWidget {
  const BreakFastSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BreakFast',
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
        BreakFastFoodListViewBlocBuilder(),
      ],
    );
  }
}
