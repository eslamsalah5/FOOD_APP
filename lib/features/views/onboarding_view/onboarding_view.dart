import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';

import 'widgets/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String pageID = 'OnBoardingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: OnBoardingViewBody(),
    );
  }
}
