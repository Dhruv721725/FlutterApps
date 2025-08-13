import 'package:flutter/material.dart';
import 'package:supabase_auth/pages/log_or_reg.dart';
import 'package:supabase_auth/pages/login_page.dart';
import 'package:supabase_auth/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Auth',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: LogOrReg(),
    );
  }
}

