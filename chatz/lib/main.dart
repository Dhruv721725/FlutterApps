
import 'package:chatz/pages/login_page.dart';
import 'package:chatz/pages/register_page.dart';
import 'package:chatz/theme/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      title: '☘️ ChatZ',
      home: RegisterPage(),
    );
  }
}
