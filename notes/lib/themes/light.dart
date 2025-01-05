import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lighMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade100, 
    secondary: Colors.grey.shade100,
    surface: Colors.grey.shade300,
    inversePrimary: Colors.grey.shade800,
    inverseSurface:Colors.grey.shade600 
  ),
  textTheme: GoogleFonts.dancingScriptTextTheme(),
);