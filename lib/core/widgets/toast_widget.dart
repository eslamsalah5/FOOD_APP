// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// void myToast({
//   required String text,
//   required ToastStates state,
// }) =>
//     Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 10,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

// // enum  كذا اختيار من حاجة

// enum ToastStates { success, error, warning,}

// Color chooseToastColor(ToastStates state) {
//   Color color;
//   switch (state) {
//     case ToastStates.success:
//       color = Colors.green;
//       break;

//     case ToastStates.error:
//       color = Colors.red;
//       break;

//     case ToastStates.warning:
//       color = Colors.amber;
//       break;
//   }
//   return color;
// }
