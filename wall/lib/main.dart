import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wall/firebase_options.dart';
import 'package:wall/pages/home_page.dart';
import 'package:wall/pages/profile_page.dart';
import 'package:wall/pages/users_page.dart';
import 'package:wall/services/auth/auth_gate.dart';
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
      home: AuthGate(),
      routes: {
        '/home':(context)=>HomePage(),
        '/users':(context)=>UsersPage(),
        '/profile':(context)=>ProfilePage(),
      },
    );
  }
}
