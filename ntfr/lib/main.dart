import 'package:flutter/material.dart';
import 'package:ntfr/noti_service.dart';
import 'package:ntfr/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // init notifications
  NotiService().initNotification();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Notifier',
      home: HomePage(),
    );
  }
}

