import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySearchView extends StatelessWidget {
  const MySearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 40.h,
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
            Flexible(
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
