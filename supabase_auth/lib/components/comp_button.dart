import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CompButton extends StatelessWidget {

  Function()? onTap;
  String title;

  CompButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(50)
        ),

        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontFamily: GoogleFonts.orbitron().fontFamily,
            fontSize: 16
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}