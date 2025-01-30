import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompButton extends StatelessWidget{
  final String value;
  final Function()? onTap;
  const CompButton({required this.value, required this.onTap,super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Center(
          child: Text(value, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}