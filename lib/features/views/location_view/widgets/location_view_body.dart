import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/my_text_button.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/home/presentation/views/home_view.dart';

class LocationViewBody extends StatelessWidget {
  const LocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 7,
          ),
          Image.asset(
            'assets/images/location.png',
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            textAlign: TextAlign.center,
            'Share your location\nwith us to order',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              textAlign: TextAlign.center,
              'Please enter your location or allow access to your location to find all restaurants that are near you ',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Spacer(
            flex: 8,
          ),
          MyTextButton(
            text: 'Enter a new location',
            onTap: () {},
            color: kPrimaryColor,
          ),
          const SizedBox(
            height: 15,
          ),
          myButton(
              onTap: () {
                navToAndClear(context, const HomeView());
              },
              text: 'Continue'),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
