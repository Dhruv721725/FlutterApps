import 'package:flutter/material.dart';

class CompDrawerTile extends StatelessWidget{
  final Icon icon;
  final String text;
  final Function()? onTap;
  CompDrawerTile({
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
        leading: icon,
        title: Text(text),
      ),
    );
  }
}