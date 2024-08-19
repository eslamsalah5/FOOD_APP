import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/widgets/widget.dart';
import 'package:food_app/views/get_start_view/widgets/login_screen.dart';

class GetStartViewBody extends StatelessWidget {
  const GetStartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          CustomButton(
              onPressed: () => navigateAndFinish(context, LoginView()),
              text: 'Get Started'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
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
          const RegisterCustomButton(
            icon: 'assets/images/facebook.png',
            text: 'Continue with Facebook',
          ),
          const RegisterCustomButton(
            icon: 'assets/images/google.png',
            text: 'Continue with Gmail',
          ),
        ],
      ),
    );
  }
}
