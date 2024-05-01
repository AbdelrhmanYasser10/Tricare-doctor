import 'package:flutter/material.dart';


import '../../color/light_app_color.dart';

class LightCardTheme {

  LightCardTheme._();

  static CardTheme lightCardTheme =   CardTheme(
    color: LightAppColor.foreGroundColors,
    surfaceTintColor: LightAppColor.foreGroundColors,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0), // Corner radius of the card
    ),

  );


}