import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/views/location_view/widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
  static const String pageID = 'locationView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Image.asset(
              'assets/images/menu.png',
            ),
          ),
        ],
      ),
      body: const LocationViewBody(),
    );
  }
}
