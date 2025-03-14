import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade900,
    tertiary: Colors.black,
    inversePrimary: Colors.grey.shade100,
  ),
  textTheme: GoogleFonts.nunitoTextTheme(),
);