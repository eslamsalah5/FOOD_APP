import 'package:flutter/material.dart';
import 'package:food_app/views/get_start_view/widgets/login_view_body.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginViewBody(formKey: formKey, emailController: emailController),
    );
  }
}
