 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall/pages/home_page.dart';

class CompTile extends StatelessWidget {
  Function()? onTap;
  String text;
  Icon icon;
  CompTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(  
        title: Text(text, style: GoogleFonts.nunito()),
        leading: icon,
      ),
    );
  }
}