import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface:Colors.grey.shade900,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade800,
    inversePrimary: Colors.grey.shade300,  
  ),
  textTheme: GoogleFonts.ptSansCaptionTextTheme()
);