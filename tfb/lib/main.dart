import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tfb/firebase_options.dart';
import 'package:tfb/pages/home_page.dart';
import 'package:tfb/pages/log_or_reg.dart';
import 'package:tfb/pages/login_page.dart';
import 'package:tfb/pages/register_page.dart';
import 'package:tfb/services/auth_gate.dart';
import 'package:tfb/theme/dark_theme.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Foodies Bar',
      theme: dark,
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
