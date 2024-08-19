import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x05323247),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Color(0x0C0C1A4B),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Icon(
              Icons.arrow_back,
              color: Color(0xff666687),
            ),
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          'Your order',
          style: TextStyle(
            color: Color(0xFF32324D),
            fontSize: 18,
            fontFamily: 'Mulish',
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset(
            'assets/images/menu.png',
          ),
        ),
      ],
    );
  }
}
