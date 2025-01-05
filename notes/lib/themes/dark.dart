import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade700, 
    secondary: Colors.grey.shade800,
    surface: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade300,
    inverseSurface:Colors.grey.shade100 
  ),
  textTheme: GoogleFonts.dancingScriptTextTheme(),
);