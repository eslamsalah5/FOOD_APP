import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/shared/widgets/widget.dart';
import 'package:food_app/views/location_view/location_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyViewBody extends StatefulWidget {
  const VerifyViewBody({super.key});

  @override
  State<VerifyViewBody> createState() => _VerifyViewBodyState();
}

class _VerifyViewBodyState extends State<VerifyViewBody> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
              child: Text(
                'Verify Code ⚡️',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff32324D),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
              child: Text(
                textAlign: TextAlign.center,
                'We just sent a 4-digit verification code to robert.fox@gmail.com. Enter the code in the box below to continue.',
                style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.8,
                    color: const Color(0xff666687),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            PinCodeTextField(
              length: 4,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                activeColor: primaryColor,
                inactiveColor: primaryColor.withOpacity(0.5),
                selectedColor: primaryColor,
                inactiveBorderWidth: 1,
                shape: PinCodeFieldShape.box,
                fieldHeight: 54,
                fieldWidth: 54,
                disabledColor: Colors.transparent,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.transparent,
              controller: textEditingController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");

                return true;
              },
              appContext: context,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'Didn’t receive a code?',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xff666687),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  textAlign: TextAlign.center,
                  ' Resend Code',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .35,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, LocationView.pageID);
              },
              text: 'Next',
            ),
          ],
        ),
      ),
    );
  }
}
