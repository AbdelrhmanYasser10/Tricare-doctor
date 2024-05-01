import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


import '../../color/light_app_color.dart';

class LightElevatedButtonStyle {
  LightElevatedButtonStyle._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor:LightAppColor.primaryColor,
      // Change the background color as needed
      foregroundColor: Colors.white,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      
      elevation: 4,
      shadowColor: Colors.grey,
      textStyle: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),

      // Adjust the button size
     // minimumSize: Size(150.w, 50.h),
      // Change the size as needed
      // Add button border
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), // Change the border radius as needed

        animationDuration: const Duration(milliseconds: 200),



    ),

  );
}
