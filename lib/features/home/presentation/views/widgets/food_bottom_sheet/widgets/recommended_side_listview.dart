import 'package:flutter/material.dart';
import 'package:food_app/models/recommended_side_model.dart';
import 'package:food_app/features/home/presentation/views/widgets/food_bottom_sheet/widgets/recommended%20_sides.dart';

class RecommendedSideListView extends StatelessWidget {
  const RecommendedSideListView({
    super.key,
    required this.recommendedSideModel,
    required this.isOrder,
  });

  final List<RecommendedSideModel> recommendedSideModel;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => RecommendedSideItem(
        recommendedSideModel: recommendedSideModel[index],
      ),
      separatorBuilder: (context, index) => SizedBox(
        height: isOrder ? 24 : 12,
      ),
      itemCount: recommendedSideModel.length,
    );
  }
}
