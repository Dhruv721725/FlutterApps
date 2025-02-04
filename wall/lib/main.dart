import 'package:flutter/material.dart';
import 'package:wall/pages/login_page.dart';
import 'package:wall/theme/light_mode.dart';

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
      title: '🧱 Wall',
      theme: lightMode,
      home: LoginPage(),
    );
  }
}
