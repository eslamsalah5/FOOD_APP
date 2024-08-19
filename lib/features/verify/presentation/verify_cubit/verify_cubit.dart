import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:meta/meta.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  Timer? _verificationTimer;

  void startEmailVerificationCheck() {
    _verificationTimer?.cancel(); // إيقاف أي تكرار موجود مسبقًا
    _verificationTimer = Timer.periodic(Duration(seconds: 5), (timer) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload(); // تحميل حالة المستخدم الجديدة
        if (user.emailVerified) {
          timer.cancel(); // إيقاف التكرار
          updateUserVerified();

          emit(CheckEmailVerifySuccess());
        }
      }
    });
  }

  void sendEmailVerification() async {
    try {
      emit(SendEmailVerifyLoading());

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        emit(SendEmailVerifySuccess());
        startEmailVerificationCheck(); // بدء التحقق الدوري
      } else {
        emit(SendEmailVerifyError(
            "User is not logged in or email is already verified."));
      }
    } on FirebaseAuthException catch (e) {
      emit(SendEmailVerifyError(e.message.toString()));
    }
  }

  void updateUserVerified() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'emailVerified': true,
    }).then((value) {
      CacheHelper.saveData(key: 'emailVerified', value: true);
      emit(UpdateUserVerifiedSuccess());
    }).catchError((error) {
      emit(UpdateUserVerifiedError(error.toString()));
    });
  }

  // void checkEmailVerified() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if (user != null && !user.emailVerified) {
  //     emit(VerifyError("Please verify your email first."));
  //   }

  //   emit(VerifySuccess());
  // }

  @override
  Future<void> close() {
    _verificationTimer?.cancel(); // إيقاف التكرار عند إغلاق الكوبت
    return super.close();
  }
}
