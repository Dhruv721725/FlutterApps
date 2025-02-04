import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wall/firebase_options.dart';
import 'package:wall/pages/login_page.dart';
import 'package:wall/pages/logorreg.dart';
import 'package:wall/pages/register_page.dart';
import 'package:wall/theme/light_mode.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
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
      home: Logorreg(),
    );
  }
}
