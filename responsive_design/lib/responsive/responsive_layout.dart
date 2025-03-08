import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget{
  final Widget mobileScaff;
  final Widget tabletScaff;
  final Widget desktopScaff;

  ResponsiveLayout({
    super.key,
    required this.mobileScaff,
    required this.tabletScaff,
    required this.desktopScaff
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if (constraints.maxWidth < 500) {
          return mobileScaff;
        }else if(constraints.maxWidth<1100){
          return tabletScaff;
        }else{
          return desktopScaff;
        }
      }
    );
  }
}