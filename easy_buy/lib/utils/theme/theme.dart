import 'package:easy_buy/utils/theme/custom_themes/appbar_theme.dart';
import 'package:easy_buy/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:easy_buy/utils/theme/custom_themes/chip_theme.dart';
import 'package:easy_buy/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:easy_buy/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:easy_buy/utils/theme/custom_themes/text_field.dart';
import 'package:easy_buy/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class EBTheme {
  EBTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: EBTextTheme.lightTextTheme,
    elevatedButtonTheme: EBElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: EBAppBarTheme.lightAppBarTheme,
    checkboxTheme: EBCheckboxTheme.lightCheckboxTheme,
    chipTheme: EBChipTheme.lightChipTheme,
    outlinedButtonTheme: EBOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: EBTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: EBTextTheme.darkTextTheme,
    elevatedButtonTheme: EBElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: EBAppBarTheme.darkAppBarTheme,
    checkboxTheme: EBCheckboxTheme.darkCheckboxTheme,
    chipTheme: EBChipTheme.darkChipTheme,
    outlinedButtonTheme: EBOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: EBTextFormFieldTheme.darkInputDecorationTheme,
  );
}