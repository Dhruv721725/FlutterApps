import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/pages/about_page.dart';
import 'package:notes/pages/home_page.dart';
import 'package:notes/pages/setting_page.dart';
import 'package:notes/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main()async{
  await Hive.initFlutter();
  await Hive.openBox("NotesBox");
  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child: const MyApp(),
    )
  );
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Notes",
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: HomePage(),
      routes:{
        "/home_page":(BuildContext context)=>HomePage(),
        "/about_page":(BuildContext context)=>AboutPage(),
        "/setting_page":(BuildContext context)=>SettingPage(),
      },
    );
  }
}