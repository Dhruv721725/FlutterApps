import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompTextfield extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool? readOnly;
  CompTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.readOnly,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly ?? false,
      style: TextStyle(
        fontSize: 20,
      ),
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color:Theme.of(context).colorScheme.secondary
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary)
        )
      ),
    );
  }
}