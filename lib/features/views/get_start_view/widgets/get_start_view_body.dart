import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/assets_name.dart';
import 'package:food_app/core/utils/constants.dart';
import 'package:food_app/core/widgets/my_button.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/register/presentation/register_cubit/register_cubit.dart';
import 'package:food_app/features/login/presentation/views/login_view.dart';

class GetStartViewBody extends StatelessWidget {
  const GetStartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text('Let’s Get Started 😁',
                        style: TextStyle(
                          fontSize: 23.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Sign up or login into to have  a full digital experience in our restaurant',
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              myButton(
                  onTap: () => navToAndClear(context, LoginView()),
                  text: 'Get Started'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 1,
                            color: Colors.grey),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: 1,
                            color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
              myButton(
                hasPrefixIcon: true,
                prefixIconAsset: Assets.imagesFacebook,
                hasPrefixIconAssets: true,
                background: Colors.white,
                text: 'Continue with Facebook',
                onTap: () {
                  try {
                    RegisterCubit.get(context).signInWithFacebook();
                  } on Exception catch (e) {
                    log('$e');
                  }
                },
                colortext: kPrimaryColor,
              ),
              SizedBox(
                height: 12.h,
              ),
              myButton(
                prefixIconAsset: Assets.imagesGoogle,
                hasPrefixIconAssets: true,
                hasPrefixIcon: true,
                onTap: () {
                  try {
                    RegisterCubit.get(context).signInWithGoogle();
                  } on Exception catch (e) {
                    log('$e');
                  }
                },
                text: 'Continue with Gmail',
                background: Colors.white,
                colortext: kPrimaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
