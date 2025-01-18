import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode= ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade300,
    tertiary: Colors.grey.shade400,
    surface: Colors.grey.shade100,
    inversePrimary: Colors.grey.shade800,
  ),
  textTheme: GoogleFonts.dancingScriptTextTheme(),
);