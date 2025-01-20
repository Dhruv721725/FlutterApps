import 'package:flutter/material.dart';

class CompTile extends StatelessWidget{
  String imagePath;

  CompTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          
        )
      ),
      child: Image.asset(
        imagePath,
        height: 50,
      ),
    );
  }
}