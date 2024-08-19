import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

class FoodInfo extends StatelessWidget {
  final String unit;
  final num amount;
  const FoodInfo({
    super.key,
    required this.unit,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$amount',
          style: const TextStyle(
            fontSize: headLineFont3,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A2D78),
          ),
        ),
        Text(
          unit,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF666687),
          ),
        ),
      ],
    );
  }
}

// Container(
//   decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       color: backgroundColor,
//       boxShadow: [
//         BoxShadow(
//             color: Color(0x33A5A5BA),
//             blurRadius: 4,
//             offset: Offset(0, 50),
//             blurStyle: BlurStyle.outer),
//       ]),
//   child: Container(
//     decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: backgroundColor,
//         boxShadow: [
//           BoxShadow(
//               color: Color(0x44A5A5BA),
//               blurRadius: 4,
//               offset: Offset(0, 20),
//               blurStyle: BlurStyle.outer),
//         ]),
//     child: Image.asset('assets/images/avocado sandwich.png'),
//   ),
// ),
// SizedBox(
//   height: 100,
// ),
