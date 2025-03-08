import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(10)
        ),),
    );
  }
}