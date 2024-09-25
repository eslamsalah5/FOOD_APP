

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/models/category_model.dart';

class SelectedCategoryItem extends StatelessWidget {
  const SelectedCategoryItem({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // Creates border
        color: Color(0xffFFB01D),
      ),
      margin: EdgeInsetsDirectional.only(
        start: 20,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 12,
        end: 12,
      ),
      child: Center(
        child: Text(
          categoryModel.categoryName,
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
  }
}



class UnSelectedCategoryItem extends StatelessWidget {
  const UnSelectedCategoryItem({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // Creates border
        color: kBackgroundColor,
      ),
      margin: EdgeInsetsDirectional.only(
        start: 20,
      ),
      padding: EdgeInsetsDirectional.only(
        start: 12,
        end: 12,
      ),
      child: Center(
        child: Text(
          categoryModel.categoryName,
          style: TextStyle(
              fontSize: 16,
              fontFamily: 'Mulish',
              fontWeight: FontWeight.w700,
              color: Color(0xff666687)),
        ),
      ),
    );
  }
}
