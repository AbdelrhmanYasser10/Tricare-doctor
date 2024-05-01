import 'package:flutter/material.dart';

import '../../color/dark_app_color.dart';
import '../../color/light_app_color.dart';

class LightAppBarTheme {

  LightAppBarTheme._();

  static AppBarTheme lightAppBarTheme =  AppBarTheme(
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
    ),
    iconTheme: const IconThemeData(
      color: LightAppColor.textColor,
      size: 25
    ),
    surfaceTintColor: LightAppColor.backgroundColor,
    backgroundColor: LightAppColor.backgroundColor,

  );
}