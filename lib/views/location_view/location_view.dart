import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/views/location_view/widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
  static const String pageID = 'locationView';

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
      body: const LocationViewBody(),
    );
  }
}
