import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/my_text_form_field.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/register/presentation/register_cubit/register_cubit.dart';
import 'package:food_app/features/register/presentation/views/widgets/phone_text_form_field.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/wrapper.dart';

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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          CacheHelper.saveData(key: 'uId', value: state.uId).then((value) {
            navToAndClear(context, const Wrapper());
          });
        }
      },
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 24.0, end: 24, top: 72),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 8.0),
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
                    padding:
                        const EdgeInsetsDirectional.symmetric(vertical: 8.0),
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
                  SizedBox(
                    height: 20.h,
                  ),
                  MyTextFormField(
                    labelText: "Email",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validate: (p0) {
                      return null;
                    },
                  ),
                  PhoneTextFormField(
                    phoneController: phoneController,
                  ),
                  MyTextFormField(
                    labelText: "Password",
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    suffix: Icons.visibility_off_outlined,
                    validate: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  ConditionalBuilder(
                    condition: state is! RegisterLoadingState,
                    builder: (context) => myButton(
                      text: "Next",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          RegisterCubit.get(context).userRegister(
                            name: userNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            context: context,
                          );
                        }
                      },
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
