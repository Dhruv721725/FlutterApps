import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode= ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    tertiary: Colors.grey.shade500,
    surface: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade100,
  ),
  textTheme: GoogleFonts.dancingScriptTextTheme()
);