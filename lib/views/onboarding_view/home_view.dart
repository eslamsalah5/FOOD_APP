import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String pageID = 'homeView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: HomeViewBody(),
    );
  }
}
