import 'package:flutter/material.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/views/get_start_view/widgets/get_start_view_body.dart';

class GetStartView extends StatelessWidget {
  const GetStartView({super.key});
  static const String pageID = 'GetStartView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: GetStartViewBody(),
    );
  }
}
