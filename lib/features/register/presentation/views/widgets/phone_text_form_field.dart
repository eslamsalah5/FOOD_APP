import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneTextFormField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneTextFormField({
    super.key,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 17.h),
      child: IntlPhoneField(
        controller: phoneController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: kPrimaryColor, style: BorderStyle.solid, width: 3),
          ),
          contentPadding: const EdgeInsetsDirectional.symmetric(
              horizontal: 16, vertical: 20),
          label: Text(
            "Phone number",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xff8E8EA9),
            ),
          ),
          counter: const SizedBox.shrink(),
          fillColor: Colors.white,
          focusColor: const Color(0xff8E8EA9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: Color(0xffEAEAEF), style: BorderStyle.solid, width: 1),
          ),
        ),
        initialCountryCode: 'EG',
      ),
    );
  }
}
