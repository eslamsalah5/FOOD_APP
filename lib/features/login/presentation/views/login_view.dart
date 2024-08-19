import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:food_app/features/login/presentation/views/widgets/login_view_body.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginViewBody(),
    );
  }
}
