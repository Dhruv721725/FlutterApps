import 'package:flutter/material.dart';
import 'package:melflow/models/playlist_provider.dart';
import 'package:melflow/pages/home_page.dart';
import 'package:melflow/pages/settings_page.dart';
import 'package:melflow/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
        ChangeNotifierProvider(create: (context)=>PlaylistProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🎧MelFlow',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
      routes: {
        '/home':(context)=>HomePage(),
        '/settings':(context)=>SettingsPage(),
      },
    );
  }
}

