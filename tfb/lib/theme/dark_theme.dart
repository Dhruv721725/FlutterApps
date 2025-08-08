import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade500,
    tertiary: Colors.black,
    inversePrimary: Colors.grey.shade300,
    onPrimary: Colors.redAccent,
    onSecondary: Colors.deepOrange,
    onTertiary: Colors.orange
  ),
  textTheme: GoogleFonts.orbitronTextTheme(),
);