import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawerTile extends StatelessWidget{
  IconData icon;
  String title;
  void Function()? onTap;
  CompDrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
        contentPadding: EdgeInsets.all(8),
        title: Text(title),
      ),
    );
  }
}