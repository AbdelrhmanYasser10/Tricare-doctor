import 'package:flutter/material.dart';


import '../color/dark_app_color.dart';
import '../custom_theme/dark_custom_theme/appBar_theme.dart';
import '../custom_theme/dark_custom_theme/card_theme.dart';
import '../custom_theme/dark_custom_theme/elevated_button_theme.dart';
import '../custom_theme/dark_custom_theme/icon_theme.dart';
import '../custom_theme/dark_custom_theme/input_text_form_filed.dart';
import '../custom_theme/dark_custom_theme/text_button_theme.dart';
import '../custom_theme/dark_custom_theme/text_theme.dart';


class AppDarkTheme {

  AppDarkTheme._();

  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: DarkAppColor.primaryColor,
    scaffoldBackgroundColor: DarkAppColor.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
        seedColor: DarkAppColor.primaryColor,
         brightness: Brightness.dark,
    ),

    cardTheme: DarkCardTheme.darkCardTheme,
    textTheme: DarkTextTheme.darkTextTheme,
    elevatedButtonTheme: DarkElevatedButtonStyle.darkElevatedButtonTheme,
    textButtonTheme: DarkTextButtonTheme.darkTextButtonTheme,
    iconTheme: DarkIconTheme.darkIconTheme,
    appBarTheme: DarkAppBarTheme.darkAppBarTheme,
    inputDecorationTheme: DarkInputDecorationTheme.darkInputDecorationTheme,
    drawerTheme: DrawerThemeData(
      backgroundColor: DarkAppColor.backgroundColor,
      surfaceTintColor: DarkAppColor.backgroundColor,


    ),




  );


}