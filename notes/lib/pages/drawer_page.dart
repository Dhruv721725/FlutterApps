import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Container(
            child: DrawerHeader(
              padding:EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: 50,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  Text(
                    "Notes",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  )
                ],
              )
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GestureDetector(
              onTap: ()=>Navigator.pushNamed(context,"/home_page"),
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("Home",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ),
          
          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GestureDetector(
              onTap: ()=>Navigator.pushNamed(context,"/about_page"),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("About",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: GestureDetector(
              onTap: ()=>Navigator.pushNamed(context,"/setting_page"),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text("Settings",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}