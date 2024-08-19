import 'package:flutter/material.dart';

class RatingCategoryItem extends StatelessWidget {
  final int rating;

  final bool isSelected;

  const RatingCategoryItem({
    super.key,
    required this.rating,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xffFFB01D) : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: isSelected
                    ? BorderSide.none
                    : BorderSide(color: Color(0xffDCDCE4))),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                '$rating',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white : Color(0xff8E8EA9),
                  fontSize: 16,
                  fontFamily: 'Mulish',
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          )),
    );
  }
}
