import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompButton extends StatelessWidget{
  void Function()? onPressed;
  Widget? child;
  CompButton({required this.onPressed, required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.fromLTRB(30,20,30,20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.secondary,
      child: child,
    );
  }
}