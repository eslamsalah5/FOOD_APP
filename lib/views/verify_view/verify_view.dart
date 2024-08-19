import 'package:flutter/material.dart';
import 'package:food_app/shared/constants/constants.dart';
import 'package:food_app/views/verify_view/widgets/verify_view_body.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 84,
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 17.0,
              vertical: 10,
            ),
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(14)),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xff666687),
                size: 25,
              ),
            ),
          ),
        ),
      ),
      body: const VerifyViewBody(),
    );
  }
}
