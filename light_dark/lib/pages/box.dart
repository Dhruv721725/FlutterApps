import 'package:flutter/widgets.dart';

class MyBox extends StatelessWidget{
  final Color? color;
  final Widget? child;
  const MyBox({
    required this.color,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(8)
      ),
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(50),
      child: Center(child: child,),
    );
  }
}