import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../color/dark_app_color.dart';

class DarkTextButtonTheme {

  DarkTextButtonTheme._();

  static TextButtonThemeData darkTextButtonTheme = TextButtonThemeData(

    style: TextButton.styleFrom(
      foregroundColor: DarkAppColor.primaryColor,
      textStyle: GoogleFonts.roboto(
        fontSize: 15,
        fontWeight: FontWeight.w800,
      ),
    ),


  );

}