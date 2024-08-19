import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final Color color;
  final double? fontSize;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  final FontWeight? fontWeight;
  const MyTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.color,
    this.fontSize,
    this.fontWeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: padding ??
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(0)),
      ),
      onPressed: () => onTap(),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
