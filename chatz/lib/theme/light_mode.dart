import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode=ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface:Colors.grey.shade300,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
    inversePrimary: Colors.grey.shade800,  
  ),
  textTheme: GoogleFonts.ptSansCaptionTextTheme()
);