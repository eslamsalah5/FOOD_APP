// import 'package:flutter/material.dart';
// import 'package:food_app/models/add_eat_model.dart';
// import 'package:food_app/features/eat_view_not_important_now/widgets/eat_view_item.dart';

// class Add_food_View extends StatelessWidget {
//   const Add_food_View({
//     super.key,
//     required this.Addfood,
//   });

//   final List<Add_food_Model> Addfood;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemBuilder: (context, index) => AddFoodItem(Add_food: Addfood[index]),
//         itemCount: Addfood.length,
//         separatorBuilder: (BuildContext context, int index) => SizedBox(
//               width: 16,
//             ));
//   }
// }
