import 'package:app2/pages/home.dart';
import 'package:app2/pages/profile.dart';
import 'package:app2/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context)=>Home(),
        '/settings':(context)=>Settings(),
      },
      home: UI(),
    );
  }
}

class UI extends StatefulWidget {
  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  final List _Pages=[
    Home(),Profile(),Settings()
  ];

  int _currentindex=0;
  
  void _navigateBottomBar(int index){
   setState(() {
     _currentindex=index;
   }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text ("AppName"),
          backgroundColor: Colors.purple,
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(200, 155, 39, 176),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.abc)),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){ 
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/home');
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
                onTap: (){ 
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
        body:Center(child:_Pages[2]),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              label: "Profile"
              ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings), 
              label: "Settings"
              ),
          ],
          onTap: _navigateBottomBar,
          currentIndex: 2,
        ),
      );
  }
}
