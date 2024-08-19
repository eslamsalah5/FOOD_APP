import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/verify/presentation/views/verify_view.dart';
import 'package:food_app/models/user_model.dart';
import 'package:food_app/wrapper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  UserModel? userModel;
  void login({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required BuildContext context,
  }) {
    emit(LoginLoading());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      emit(LoginSuccess(
        value.user!.uid,
      ));
    }).catchError((error) {
      emit(LoginError(error.toString()));
    });
  }

  // getUser({required String uId}) {
  //   emit(LoginGetUserLoading());
  //   FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
  //     userModel = UserModel.fromMap(value.data()!);
  //     emit(LoginGetUserSuccess());
  //   }).catchError((error) {
  //     emit(LoginGetUserError(error.toString()));
  //   });
  //   return userModel;
  // }
}
