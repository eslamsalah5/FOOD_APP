import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/widgets/my_text_button.dart';
import 'package:food_app/core/widgets/nav_to_and_replace.dart';

class MySearchBar extends StatelessWidget {
  final Function? onSaved;
  final TextEditingController SearchController;
  const MySearchBar({
    super.key,
    this.onSaved,
    required this.SearchController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xff1B1B1B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Color(
                      0xff343434,
                    ),
                  )),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13.0,
                  ),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      controller: SearchController,
                      onFieldSubmitted: (newValue) => onSaved!(newValue),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 4.w),
        MyTextButton(
          onTap: () {},
          text: 'cancel',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
