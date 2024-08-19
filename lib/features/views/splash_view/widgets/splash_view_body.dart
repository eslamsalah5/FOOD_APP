import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/assets_name.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/home/presentation/views/home_view.dart';
import 'package:food_app/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';
import 'package:food_app/features/views/onboarding_view/onboarding_view.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/wrapper.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  UserModel? userModel;
  @override
  void initState() {
    super.initState();

    _navToHome();
  }

  void _navToHome() {
    Widget widget = getHomeWidget();

    Future.delayed(
      const Duration(seconds: 3),
      () {
        navToAndClear(context, widget);
      },
    );
  }

  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;

  // String? uId = CacheHelper.getData(key: 'uId');

  Widget getHomeWidget() {
    if (onBoarding == false) {
      return const OnBoardingView();
    } else {
      return const Wrapper();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Image.asset(
          Assets.imagesFoodPicture,
          height: 180,
        ),
        const Spacer(
          flex: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4a4a6a),
                    ),
                  ),
                  Text(
                    'Easy',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffff7b2c),
                    ),
                  ),
                ],
              ),
              Image.asset(
                Assets.imagesFoodPicture2,
                height: 200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
