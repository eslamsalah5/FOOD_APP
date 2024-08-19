import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/views/eat_view/widgets/eat_view_body.dart';

class EatView extends StatelessWidget {
  const EatView({super.key});
  static const String pageID = 'EatView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
      body: const EatViewBody(),
    );
  }
}
