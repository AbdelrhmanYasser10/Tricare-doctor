import 'package:flutter/material.dart';
import '../color/light_app_color.dart';
import '../custom_theme/light_custom_theme/appBar_theme.dart';
import '../custom_theme/light_custom_theme/card_theme.dart';
import '../custom_theme/light_custom_theme/elevated_button_theme.dart';
import '../custom_theme/light_custom_theme/icon_theme.dart';
import '../custom_theme/light_custom_theme/input_text_form_filed.dart';
import '../custom_theme/light_custom_theme/text_button_theme.dart';
import '../custom_theme/light_custom_theme/text_theme.dart';

class AppLightTheme {

  AppLightTheme._();

  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    primaryColor: LightAppColor.primaryColor,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
        seedColor: LightAppColor.primaryColor,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: LightAppColor.backgroundColor,

    cardTheme: LightCardTheme.lightCardTheme,
    textTheme: LightTextTheme.lightTextTheme,
    elevatedButtonTheme: LightElevatedButtonStyle.lightElevatedButtonTheme,
    textButtonTheme: LightTextButtonTheme.lightTextButtonTheme,
    iconTheme: LightIconTheme.lightIconTheme,
    appBarTheme: LightAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: LightInputDecorationTheme.lightInputDecorationTheme,

  );


}