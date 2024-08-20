import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/wrapper.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required BuildContext context,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      emit(RegisterSuccessState(
        value.user!.uid,
      ));
      userCreate(
        userName: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      log(error.toString());
    });
  }

  Future<void> userCreate({
    required String userName,
    required String email,
    required String phone,
    required String uId,
  }) async {
    try {
      UserModel model = UserModel(
        email: email,
        phone: phone,
        uId: uId,
        userName: userName,
        isEmailVerified: false,
        totalPrice: 0,
        customerId: '',
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toMap());

      emit(RegisterSuccessCreateUserState());
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorCreateUserState(error.toString()));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    emit(RegisterGoogleLoadingState());

    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      emit(RegisterGoogleSuccessState());
      return userCredential;
    } catch (error) {
      // Handle any errors that occurred during the sign-in process
      emit(RegisterGoogleErrorState(error.toString()));
      rethrow; // Rethrow the error to propagate it further if needed
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    emit(RegisterFacebookLoadingState());

    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status == LoginStatus.success) {
        // Get the Access Token
        final accessToken = loginResult.accessToken;

        if (accessToken != null) {
          // Create a credential from the access token
          final OAuthCredential facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken.tokenString);

          // Once signed in, return the UserCredential
          final userCredential = await FirebaseAuth.instance
              .signInWithCredential(facebookAuthCredential);

          emit(RegisterFacebookSuccessState());
          return userCredential;
        } else {
          emit(RegisterFacebookErrorState('Access token is null'));
          throw Exception('Access token is null');
        }
      } else if (loginResult.status == LoginStatus.cancelled) {
        emit(RegisterFacebookCancelledState());
        throw Exception('Sign in with Facebook was cancelled');
      } else {
        emit(
            RegisterFacebookErrorState(loginResult.message ?? 'Unknown error'));
        throw Exception(loginResult.message);
      }
    } catch (error) {
      // Handle any errors that occurred during the sign-in process
      emit(RegisterFacebookErrorState(error.toString()));
      return Future.error(
          error); // Return a Future error to handle it appropriately
    }
  }
}
