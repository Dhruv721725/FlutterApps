import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urban_sneaks/models/cart_model.dart';
import 'package:urban_sneaks/pages/intro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CartModel(),
      builder:(context, child)=>const MaterialApp(
        title: "Urban Sneaks",
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ) ,
    );
  }
}
