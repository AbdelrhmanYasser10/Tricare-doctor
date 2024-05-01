import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../color/dark_app_color.dart';

class DarkElevatedButtonStyle {
  DarkElevatedButtonStyle._();

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:DarkAppColor.primaryColor,
      // Change the background color as needed
      foregroundColor: DarkAppColor.textColor,

      
      elevation: 0,

      textStyle: GoogleFonts.roboto(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),

      // Adjust the button size
    //  minimumSize: Size(100.w, 40.h),
      // Change the size as needed
      // Add button border
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Change the border radius as needed

        animationDuration: const Duration(milliseconds: 200),



    ),

  );
}
