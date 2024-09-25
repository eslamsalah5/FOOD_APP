import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/widgets/appetizer_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/beef_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/break_fast_section.dart';
import 'package:food_app/features/home/presentation/views/widgets/most_popular_section.dart';

class AllDishes extends StatelessWidget {
  const AllDishes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
      ),
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          MostPopularSection(),
        
          BreakFastSection(),
        
          AppetizerSection(),
        
          BeefSection(),
        ],
      ),
    );
  }
}
