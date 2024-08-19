import 'package:flutter/material.dart';

void navToAndReplace(context, widget) => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
