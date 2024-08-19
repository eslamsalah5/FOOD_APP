import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Widget? child;
  final GestureTapCallback? ontap;

  const MyContainer({
    Key? key,
    this.width = double.infinity,
    this.height = 100,
    this.child,
    this.borderRadius = 12,
    this.backgroundColor,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          // Use BoxDecoration instead of ShapeDecoration
          color:
              backgroundColor ?? Colors.white, // Apply the backgroundColor here
          borderRadius:
              BorderRadius.circular(borderRadius.r), // Apply borderRadius here
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 1,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
