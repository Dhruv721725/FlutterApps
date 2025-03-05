import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notifier/api/firebase_api.dart';
import 'package:notifier/firebase_options.dart';
import 'package:notifier/pages/home_page.dart';

final navigatorKey=GlobalKey<NavigatorState>();

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotificaion();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifier',
      home: HomePage(),
    );
  }
}

