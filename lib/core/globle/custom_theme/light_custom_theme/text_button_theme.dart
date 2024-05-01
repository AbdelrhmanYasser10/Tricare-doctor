import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../color/light_app_color.dart';


class LightTextButtonTheme {

  LightTextButtonTheme._();

  static TextButtonThemeData lightTextButtonTheme = TextButtonThemeData(

    style: TextButton.styleFrom(
      foregroundColor: LightAppColor.primaryColor,
      textStyle: GoogleFonts.roboto(
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    ),


  );

}