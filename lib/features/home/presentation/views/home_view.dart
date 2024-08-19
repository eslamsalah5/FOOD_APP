import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(
              'assets/images/menu.png',
            ),
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
