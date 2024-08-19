import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/constants.dart';

class myButton extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? prefixIconAsset;
  final String? suffixIconAssets;
  final bool hasPrefixIconAssets;
  final bool hasSuffixIconAssets;
  final Color iconColor;
  final Color? background;
  final bool isBackgroundGold = true;
  final bool? isSelected;
  final void Function() onTap;
  final String text;
  final int fontSize;
  final FontWeight fontWeight;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final bool isUpperCase;
  final Color? colortext;
  final Color? borderColor;
  final bool? hasPrefixIcon;
  final bool? hasSuffixIcon;
  const myButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height,
    this.width,
    this.background,
    this.radius,
    this.colortext,
    this.isUpperCase = false,
    this.borderColor,
    this.prefixIcon,
    this.hasPrefixIcon,
    this.suffixIcon,
    this.hasSuffixIcon,
    this.fontSize = 14,
    this.iconColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.padding,
    this.isSelected,
    this.prefixIconAsset,
    this.suffixIconAssets,
    this.hasPrefixIconAssets = false,
    this.hasSuffixIconAssets = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 45.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius ?? 16.r,
            ),
            color: background ?? kPrimaryColor,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasSuffixIcon ?? false
                  ? Row(
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            isUpperCase ? text.toUpperCase() : text,
                            style: TextStyle(
                              color: colortext ?? Colors.white,
                              fontSize: fontSize.sp,
                              fontWeight: fontWeight,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        hasSuffixIconAssets
                            ? Image.asset(
                                suffixIconAssets!,
                              )
                            : Icon(
                                suffixIcon,
                                color: iconColor,
                              )
                      ],
                    )
                  : hasPrefixIcon ?? false
                      ? Row(
                          children: [
                            hasPrefixIconAssets
                                ? Image.asset(
                                    prefixIconAsset!,
                                    height: 18.33.h,
                                    width: 18.33.w,
                                  )
                                : Icon(
                                    prefixIcon,
                                    color: iconColor,
                                  ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              isUpperCase ? text.toUpperCase() : text,
                              style: TextStyle(
                                color: colortext ?? Colors.white,
                                fontSize: fontSize.sp,
                                fontWeight: fontWeight,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          isUpperCase ? text.toUpperCase() : text,
                          style: TextStyle(
                            color: colortext ?? Colors.white,
                            fontSize: fontSize.sp,
                            fontWeight: fontWeight,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
