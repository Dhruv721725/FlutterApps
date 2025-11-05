import 'package:bee_list/pages/home_page.dart';
import 'package:bee_list/theme/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';


// final FlutterLocalNotificationsPlugin flnp = FlutterLocalNotificationsPlugin();
void main()async{
  // WidgetsFlutterBinding.ensureInitialized();
  // const AndroidInitializationSettings andrdinitsset = AndroidInitializationSettings('@mipmap/ic_launcher');
  // const InitializationSettings initset = InitializationSettings(android: andrdinitsset);
  // await flnp.initialize(initset);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bee\'s List',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
    );
  }
}
