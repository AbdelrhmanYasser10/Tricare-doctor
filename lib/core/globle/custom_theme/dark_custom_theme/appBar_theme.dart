import 'package:flutter/material.dart';

import '../../color/dark_app_color.dart';

class DarkAppBarTheme {

  DarkAppBarTheme._();

  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      ),
    ),
    iconTheme: IconThemeData(
      color: DarkAppColor.textColor,
      size: 25
    ),
    surfaceTintColor: DarkAppColor.backgroundColor,
    backgroundColor: DarkAppColor.backgroundColor,

  );
}