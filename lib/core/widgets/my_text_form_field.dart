import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/constants.dart';

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? keyboardIconAction;
  final String? Function(String?) validate;
  final IconData? suffix;
  final IconData? prefix;
  final bool? isPassword;
  final bool isAutoFocus;
  final Function? suffixPressed;
  final Function? submit;
  final int? maxLine;

  const MyTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.validate,
    this.suffix,
    this.prefix,
    this.suffixPressed,
    this.submit,
    this.maxLine,
    this.isPassword,
    this.keyboardIconAction,
    this.isAutoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: keyboardIconAction,
      validator: validate,
      obscureText: isPassword ?? false,
      maxLines: isPassword ?? false ? 1 : maxLine,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: kPrimaryColor, style: BorderStyle.solid, width: 1),
        ),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
        label: Text(
          labelText,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xff8E8EA9),
          ),
        ),
        fillColor: Colors.white,
        focusColor: Colors.cyan,
        prefixIcon: prefix != null
            ? Icon(
                prefix,
                color: Colors.grey,
              )
            : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () => suffixPressed?.call(),
                icon: Icon(
                  suffix,
                  color: Colors.grey,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
              color: Color(0xffDFDFE1), style: BorderStyle.solid, width: 1),
        ),
      ),
    );
  }
}
