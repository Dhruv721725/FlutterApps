import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NeuBox extends StatelessWidget{
  final Widget? child;
  NeuBox({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          // darker shadow on bottom right
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-4, -4),
          ),

          // lighter shadow on top left
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: Offset(4, 4),
          )
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: child),
    );
  }
}