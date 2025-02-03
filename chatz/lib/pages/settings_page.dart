import 'package:chatz/components/comp_drawer.dart';
import 'package:chatz/theme/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget{
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),

      drawer: CompDrawer(),
      
      body: Column(
        children: [
          ListTile(
            title: Text("Dark Theme"),
            trailing:CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).isDarkMode, 
              onChanged: (val){
                setState(() {
                  Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                });
              }
            ),
          )
        ],
      ) 
      );
  }
}