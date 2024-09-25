import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/most_popular_foods_list_view.bloc.builder.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Popular',
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
          MostPopularFoodListViewBlocBuilder(),
            SizedBox(height: 20),
        ],
      ),
    );
  }
}
