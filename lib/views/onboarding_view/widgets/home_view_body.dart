import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/widgets/widget.dart';
import 'package:food_app/views/get_start_view/get_start_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
          CustomTextButton(
            text: "Sign up later",
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            onPressed: () => navigateAndFinish(context, const GetStartView()),
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
