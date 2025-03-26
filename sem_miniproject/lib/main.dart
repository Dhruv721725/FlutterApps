import 'package:flutter/material.dart';
import 'package:sem_miniproject/pages/creation_page.dart';
import 'package:sem_miniproject/pages/travel_page.dart';
import 'package:sem_miniproject/theme/dark_mode.dart';

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
      title: 'Travo Genie',
      theme: darkMode,
      home: CreationPage()
    );
  }
}
