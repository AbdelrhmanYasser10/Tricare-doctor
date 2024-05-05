import 'package:flutter/material.dart';


import '../../color/dark_app_color.dart';
import '../../color/light_app_color.dart';

class LightInputDecorationTheme {

  LightInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(


    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: DarkAppColor.primaryColor, width: 1),
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
    fillColor: LightAppColor.foreGroundColors,
    filled: true,


  //  contentPadding:  EdgeInsets.symmetric(vertical: 15,horizontal: 25),

  );

}