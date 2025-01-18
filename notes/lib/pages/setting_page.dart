import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/pages/drawer_page.dart';
import 'package:notes/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage  extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: DrawerPage(),
      body:Column(
        children:[
          Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
      
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context).isDarkMode, 
                  inactiveTrackColor:Theme.of(context).colorScheme.surface ,
                  onChanged: (value){
                    setState(() {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    });
                  },
                )
              ],
            ),
          )
        ]
      )
    );
  }
}