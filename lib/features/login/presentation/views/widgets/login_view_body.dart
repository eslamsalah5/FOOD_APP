import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/my_text_form_field.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/login/presentation/login_cubit/login_cubit.dart';
import 'package:food_app/features/register/presentation/views/register_view.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/wrapper.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navToAndClear(context, const Wrapper());
          });
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    Text('Login',
                        style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Login into your account',
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Email can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextFormField(
                      labelText: "Password",
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return "Password can't be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 64,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (context) => myButton(
                        text: 'Login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                              emailController: emailController,
                              passwordController: passwordController,
                              context: context,
                            );
                          }
                        },
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () =>
                              navToAndClear(context, const RegisterView()),
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
