import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/widgets/widget.dart';
import 'package:food_app/views/register_view/register_view.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text('What’s your email? 📨',
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'We need it to search after your account or create a new one',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
            MyTextFormField(
              labelText: "Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validate: (p0) {
                return null;
              },
            ),
            const Spacer(),
            CustomButton(
              text: 'Next',
              onPressed: () {
                navigateTo(context, const RegisterView());
              },
            )
          ],
        ),
      ),
    );
  }
}
