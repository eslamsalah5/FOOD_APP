import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/my_text_button.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/home/presentation/views/home_view.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';
import 'package:food_app/wrapper.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  void save() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navToAndClear(context, const GetStartView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.225,
                  decoration: const BoxDecoration(
                    color: Color(0xffFFB080),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Positioned(
                right: MediaQuery.of(context).size.height * 0.20,
                child: Image.asset(
                  'assets/images/phone.png',
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
              )
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Text(
            'Full contactless experience',
            style: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "From ordering to paying, that's all contactless",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff3E3E58),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MyTextButton(
            text: "Sign up later",
            onTap: () {
              navToAndClear(context, const HomeView());
            },
            color: kPrimaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          myButton(
            onTap: () => save(),
            text: 'Get Started',
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
