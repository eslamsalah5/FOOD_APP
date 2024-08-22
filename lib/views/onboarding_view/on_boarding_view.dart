import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String pageID = 'OnBoarding';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: OnBoardingViewBody(),
    );
  }
}
