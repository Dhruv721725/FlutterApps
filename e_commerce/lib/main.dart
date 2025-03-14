import 'package:e_commerce/models/shop.dart';
import 'package:e_commerce/pages/about_page.dart';
import 'package:e_commerce/pages/cart_page.dart';
import 'package:e_commerce/pages/home_page.dart';
import 'package:e_commerce/pages/intro_page.dart';
import 'package:e_commerce/pages/shop_page.dart';
import 'package:e_commerce/themes/dark_mode.dart';
import 'package:e_commerce/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(), 
      child:  MyApp()
      )
    );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-Commerce",
      home: IntroPage(),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      routes: {
        '/intro_page':(context)=> IntroPage(),
        '/shop_page':(context)=>ShopPage(),
        '/cart_page':(context)=>CartPage(),
        '/home_page':(context)=>HomePage(),
        '/about_page':(context)=>AboutPage(),
      },
    );
  }
}
