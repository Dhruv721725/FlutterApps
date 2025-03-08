import 'package:flutter/material.dart';
import 'package:responsive_design/responsive/desktop_scaff.dart';
import 'package:responsive_design/responsive/mobile_scaff.dart';
import 'package:responsive_design/responsive/responsive_layout.dart';
import 'package:responsive_design/responsive/tablet_scaff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive design',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ResponsiveLayout(
        mobileScaff: MobileScaff(), 
        tabletScaff: TabletScaff(), 
        desktopScaff: DesktopScaff()
      ),
    );
  }
}
