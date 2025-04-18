import 'package:chatbot/auth/auth_gate.dart';
import 'package:chatbot/auth/log_or_reg.dart';
import 'package:chatbot/firebase_options.dart';
import 'package:chatbot/pages/home_page.dart';
import 'package:chatbot/pages/login_page.dart';
import 'package:chatbot/theme/lightmode.dart';
import 'package:chatbot/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context)=>ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jimmy',
      theme: Provider.of<ThemeProvider>(context).theme,
      home: AuthGate(),
    );
  }
}
