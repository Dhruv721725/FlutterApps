import 'package:app1/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:app1/pages/second_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/secondpage':(context)=>SecondPage(),
        '/firstpage':(context)=>FirstPage()
      },
    );
  }
}

