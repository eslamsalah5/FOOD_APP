import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/core/utils/cache_helper.dart';
import 'package:food_app/core/widgets/nav_and_clear.dart';
import 'package:food_app/features/verify/presentation/verify_cubit/verify_cubit.dart';
import 'package:food_app/features/views/get_start_view/get_start_view.dart';
import 'package:food_app/wrapper.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key});

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyCubit()..sendEmailVerification(),
      child: BlocConsumer<VerifyCubit, VerifyState>(
        listener: (context, state) {
          if (state is CheckEmailVerifySuccess) {
            navToAndClear(context, const Wrapper());
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  Icon(Icons.email_outlined,
                      size: 100.h, color: Colors.blueAccent),
                  SizedBox(height: 40.h),
                  Text(
                    'Check Your Email',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff32324D),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'A verification link has been sent to your email. Please check your inbox and click on the link to verify your email address.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.5,
                      color: const Color(0xff666687),
                    ),
                  ),
                  // SizedBox(height: 40.h),
                  // BlocBuilder<VerifyCubit, VerifyState>(
                  //   builder: (context, state) {
                  //     if (state is VerifyLoading) {
                  //       return const CircularProgressIndicator();
                  //     } else if (state is VerifyError) {
                  //       return Text(
                  //         state.error,
                  //         style: TextStyle(
                  //           color: Colors.red,
                  //           fontSize: 14.sp,
                  //         ),
                  //       );
                  //     } else if (state is VerifySuccess) {
                  //       // عرض رسالة نجاح إذا تم إرسال الرابط بنجاح
                  //       return Column(
                  //         children: [
                  //           Text(
                  //             'Verification email sent successfully!',
                  //             style: TextStyle(
                  //               color: Colors.green,
                  //               fontSize: 16.sp,
                  //             ),
                  //           ),
                  //           SizedBox(height: 20.h),
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               // إعادة تحميل الصفحة للتحقق من حالة التحقق
                  //               navToAndClear(context, Wrapper());
                  //             },
                  //             style: ElevatedButton.styleFrom(
                  //               backgroundColor: Colors.blueAccent,
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(8.r),
                  //               ),
                  //               padding: EdgeInsets.symmetric(vertical: 16.h),
                  //             ),
                  //             child: Text(
                  //               'Check Verification Status',
                  //               style: TextStyle(
                  //                 fontSize: 16.sp,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     } else {
                  //       return ElevatedButton(
                  //         onPressed: () {
                  //           BlocProvider.of<VerifyCubit>(context)
                  //               .sendEmailVerification();
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.blueAccent,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.r),
                  //           ),
                  //           padding: EdgeInsets.symmetric(vertical: 16.h),
                  //         ),
                  //         child: Text(
                  //           'Resend Verification Email',
                  //           style: TextStyle(
                  //             fontSize: 16.sp,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 20.h),
                  TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) => {
                            CacheHelper.removeData(key: 'uId').then((value) => {
                                  navToAndClear(
                                    context,
                                    const GetStartView(),
                                  )
                                })
                          });
                    },
                    child: Text(
                      'Already Verified? Login',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
