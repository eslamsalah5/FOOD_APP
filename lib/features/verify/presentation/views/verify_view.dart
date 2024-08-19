import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/features/verify/presentation/verify_cubit/verify_cubit.dart';
import 'package:food_app/features/verify/presentation/views/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: const VerifyViewBody(),
    );
  }
}
