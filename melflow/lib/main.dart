import 'package:flutter/material.dart';
import 'package:melflow/pages/home_page.dart';
import 'package:melflow/theme/dark_mode.dart';
import 'package:melflow/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melflow',
      theme: lightMode,
      darkTheme: darkMode,
      home: HomePage(),
    );
  }
}

