// import 'package:flutter/material.dart';

// class MyTextFormField extends StatelessWidget {
//   final TextEditingController controller;
//   final TextInputType type;
//   final void Function(String)? onSubmit;
//   final void Function(String)? onChange;
//   final void Function()? onTap;
//   final bool isPassword;
//   final bool isAutoFocus;
//   final TextInputAction? keyboardIconAction;
//   final FormFieldValidator<String>? validate;
//   final String label;
//   final IconData? prefix;
//   final IconData? suffix;
//   final void Function()? suffixPressed;
//   final bool isClickable;
//   const MyTextFormField({
//     super.key,
//     required this.controller,
//     required this.type,
//     this.onSubmit,
//     this.onChange,
//     this.onTap,
//     this.isPassword = false,
//     this.isAutoFocus = false,
//     this.keyboardIconAction,
//     this.validate,
//     required this.label,
//     this.prefix,
//     this.suffix,
//     this.suffixPressed,
//     this.isClickable = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textInputAction: keyboardIconAction,
//       autofocus: isAutoFocus,
//       style: const TextStyle(color: Colors.deepPurple),
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: onSubmit,
//       onChanged: onChange,
//       onTap: onTap,
//       validator: validate,
//       // style: const TextStyle(color: Colors.deepPurple),
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 onPressed: suffixPressed,
//                 icon: Icon(
//                   suffix,
//                 ),
//               )
//             : null,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }
