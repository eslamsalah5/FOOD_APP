import 'package:flutter/material.dart';

class GridRatingItem extends StatelessWidget {
  final num rating;
  const GridRatingItem({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      right: 10,
      child: Container(
        width: 50,
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 6.61, vertical: 4.96),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0F14253F),
              blurRadius: 13.22,
              offset: Offset(0, 8.27),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x0C0C1A4B),
              blurRadius: 8.27,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            Text(
              '$rating',
              style: TextStyle(
                color: Color(0xFF8E8EA9),
                fontSize: 11,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
