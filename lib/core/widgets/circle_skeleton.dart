// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:watpad_clone/core/utils/constants.dart';

// class CircleSkeleton extends StatelessWidget {
//   const CircleSkeleton({Key? key, this.size = 24}) : super(key: key);

//   final double? size;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: kPrimaryColor,
//       highlightColor: kBackGroundColor,
//       child: Container(
//         height: size,
//         width: size,
//         decoration: BoxDecoration(
//           color: Theme.of(context).primaryColor.withOpacity(0.04),
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }
