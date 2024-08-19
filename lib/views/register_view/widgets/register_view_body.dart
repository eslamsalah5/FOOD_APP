import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/widgets/widget.dart';
import 'package:food_app/views/register_view/widgets/phone_text_form_field.dart';
import 'package:food_app/views/verify_view/verify_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 24.0, end: 24, top: 72),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
                child: Text(
                  'Getting started! ✌️',
                  style: TextStyle(
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff32324D),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Look like you are new to us! Create an account for a complete experience.',
                  style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.8,
                      color: const Color(0xff666687),
                      fontWeight: FontWeight.w500),
                ),
              ),
              MyTextFormField(
                labelText: "Username",
                controller: userNameController,
                keyboardType: TextInputType.name,
                validate: (p0) {
                  return null;
                },
              ),
              MyTextFormField(
                labelText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validate: (p0) {
                  return null;
                },
              ),
              const PhoneTextFormField(),
              MyTextFormField(
                labelText: "Password",
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                suffix: Icons.visibility_off_outlined,
                validate: (p0) {
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: MediaQuery.of(context).size.height * 0.14, bottom: 20),
                child: CustomButton(
                  onPressed: () {
                    navigateTo(context, const VerifyView());
                  },
                  text: 'Next',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
