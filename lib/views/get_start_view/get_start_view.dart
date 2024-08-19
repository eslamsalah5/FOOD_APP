import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/views/get_start_view/widgets/get_start_view_body.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});
  static const String pageID = 'GetStartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: GetStartViewBody(),
    );
  }
}
