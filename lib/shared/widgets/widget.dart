import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/constants/constants.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ), (route) {
      return false;
    });

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool? isLoading;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: isLoading == true
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validate;
  final IconData? suffix;
  final IconData? prefix;
  final bool isPassword = false;
  final Function? suffixPressed;
  const MyTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.validate,
    this.suffix,
    this.prefix,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 14.h),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isPassword,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: primaryColor, style: BorderStyle.solid, width: 3),
          ),
          contentPadding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16, vertical: 20),
          label: Text(
            labelText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff8E8EA9),
            ),
          ),
          fillColor: Colors.white,
          focusColor: const Color(0xff8E8EA9),
          prefixIcon: prefix != null
              ? Icon(
                  prefix,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    suffix,
                    color: Colors.grey,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: Color(0xffEAEAEF), style: BorderStyle.solid, width: 1),
          ),
        ),
      ),
    );
  }
}

class RegisterCustomButton extends StatelessWidget {
  const RegisterCustomButton({
    super.key,
    required this.icon,
    required this.text,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: backgroundColor),
          width: MediaQuery.of(context).size.width * 0.85,
          height: 54,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Image(
                    image: AssetImage(icon),
                    height: 24,
                    width: 24,
                  ),
                  onTap: () {},
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
