import 'package:flutter/material.dart';
import 'package:food_app/views/onboarding_view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacementNamed(OnBoardingView.pageID);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Image.asset(
          'assets/images/Food picture.png',
          height: 180,
        ),
        const Spacer(
          flex: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Eat',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff4a4a6a),
                    ),
                  ),
                  Text(
                    'Easy',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffff7b2c),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/Food picture-2.png',
                height: 200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
