import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/cutom_app_bar.dart';
import 'package:food_app/features/thank_you/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
          offset: const Offset(0, -10), child: const ThankYouViewBody()),
    );
  }
}
