import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/home/presentation/views/home_view.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return snapshot.hasData
              ? _getRedirectView(snapshot.data)
              : const GetStartView(); // المستخدم غير مسجل دخول
        },
      ),
    );
  }

  Widget _getRedirectView(User? user) {
    if (user == null) return const GetStartView();
    return user.emailVerified ? const HomeView() : const VerifyView();
  }
}
