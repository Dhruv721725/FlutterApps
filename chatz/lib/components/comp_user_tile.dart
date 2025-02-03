import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompUserTile extends StatelessWidget{
  final String text;
  final void Function()? onTap;
  const CompUserTile({
    super.key, 
    required this. text,
    required this.onTap,
    });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // icon
            Icon(Icons.deblur_rounded),
            SizedBox(width: 20,),
            // username
            Text(text),
          ],
        ),
      ),
    );
  }
}