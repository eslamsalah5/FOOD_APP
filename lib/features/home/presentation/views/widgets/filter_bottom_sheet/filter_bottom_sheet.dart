import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/price_range_slider.dart';

import 'package:food_app/features/home/presentation/views/widgets/category_item.dart';
import 'package:food_app/features/home/presentation/views/widgets/filter_bottom_sheet/widgets/rating_category_item.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filters',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF32324D),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 24,
              ),
            ),
            Text(
              'Select Categories',
              style: TextStyle(
                color: Color(0xFF666687),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            // Row(
            //   children: [
            //     CategoryItem(text: 'Food', isSelected: true, isFilter: true),
            //     SizedBox(
            //       width: 12,
            //     ),
            //     CategoryItem(text: 'Drink', isSelected: false, isFilter: true),
            //     SizedBox(
            //       width: 12,
            //     ),
            //     CategoryItem(
            //         text: 'Dessert', isSelected: false, isFilter: true),
            //   ],
            // ),
            Flexible(
              child: SizedBox(
                height: 24,
              ),
            ),
            Text(
              'Select Product Type',
              style: TextStyle(
                color: Color(0xFF666687),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children: [
                // Row(
                //   children: [
                //     CategoryItem(
                //         text: 'Pizza', isSelected: false, isFilter: true),
                //     SizedBox(
                //       width: 12,
                //     ),
                //     CategoryItem(
                //         text: 'Burger', isSelected: false, isFilter: true),
                //     SizedBox(
                //       width: 12,
                //     ),
                //     CategoryItem(
                //         text: 'Salad', isSelected: true, isFilter: true),
                //     SizedBox(
                //       width: 12,
                //     ),
                //     CategoryItem(
                //         text: 'Soup', isSelected: false, isFilter: true),
                //   ],
                // ),
                SizedBox(
                  height: 12,
                ),
                //   Row(
                //     children: [
                //       CategoryItem(
                //           text: 'Chicken', isSelected: false, isFilter: true),
                //       SizedBox(
                //         width: 12,
                //       ),
                //       CategoryItem(
                //           text: 'Grill', isSelected: false, isFilter: true),
                //       SizedBox(
                //         width: 12,
                //       ),
                //       CategoryItem(
                //           text: 'Breakfast', isSelected: false, isFilter: true),
                //     ],
                //   ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: 24,
              ),
            ),
            Text(
              'Rating',
              style: TextStyle(
                color: Color(0xFF666687),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Column(
              children: [
                Row(
                  children: [
                    RatingCategoryItem(
                      rating: 1,
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    RatingCategoryItem(
                      rating: 2,
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    RatingCategoryItem(
                      rating: 3,
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    RatingCategoryItem(
                      rating: 4,
                      isSelected: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    RatingCategoryItem(
                      rating: 5,
                      isSelected: false,
                    ),
                  ],
                ),
              ],
            ),
            Flexible(
              child: SizedBox(
                height: 24,
              ),
            ),
            Text(
              'Price Range',
              style: TextStyle(
                color: Color(0xFF666687),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            PriceRangeSlider(),
            SizedBox(
              height: 24,
            ),
            myButton(
              onTap: () {},
              text: 'Apply',
              background: Color(0xff615793),
            ),
          ],
        ),
      ),
    );
  }
}
