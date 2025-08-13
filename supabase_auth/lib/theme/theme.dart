import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.green.shade50,
    primary: Colors.green.shade200,
    secondary: Colors.green.shade400,
    tertiary: Colors.green.shade500,
    inversePrimary: Colors.green.shade700,
    inverseSurface: Colors.green.shade900
  ),
  textTheme: GoogleFonts.rajdhaniTextTheme(),
);