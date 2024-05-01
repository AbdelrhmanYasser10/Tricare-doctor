import 'package:flutter/material.dart';

import '../../color/dark_app_color.dart';

class DarkCardTheme {

  DarkCardTheme._();

  static CardTheme darkCardTheme =   CardTheme(
    color: DarkAppColor.foreGroundColors,
    shadowColor:  Colors.grey,
    surfaceTintColor: DarkAppColor.foreGroundColors,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Corner radius of the card
    ),

  );


}