import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/beef_food_list_view_bloc_builder.dart';

class BeefSection extends StatelessWidget {
  const BeefSection({
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
            'Beef',
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
          BeefFoodListViewBlocBuilder(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
