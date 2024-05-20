import 'package:flutter/material.dart';


import '../../color/dark_app_color.dart';
import '../../color/shared_color.dart';

class DarkInputDecorationTheme {

  DarkInputDecorationTheme._();

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(


    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.primaryColor, width: 1),
      borderRadius: BorderRadius.circular(15),

    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15),

    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15),

    ),
    fillColor: DarkAppColor.foreGroundColors,
    filled: true,




  );

}