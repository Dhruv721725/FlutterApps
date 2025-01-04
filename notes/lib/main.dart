import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/pages/about_page.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/setting_page%20.dart';
import 'package:notes/themes/light.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox("NotesBox");
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      theme: lighMode,
      home: HomePage(),
      routes:{
        "/home_page":(BuildContext context)=>HomePage(),
        "/about_page":(BuildContext context)=>AboutPage(),
        "/setting_page":(BuildContext context)=>SettingPage(),
      },
    );
  }
}