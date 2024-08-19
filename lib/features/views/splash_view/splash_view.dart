import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const String pageID = 'splashView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: SplashViewBody(),
    );
  }
}
