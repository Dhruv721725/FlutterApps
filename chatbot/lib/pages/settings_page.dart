import 'package:chatbot/auth/auth_services.dart';
import 'package:chatbot/components/comp_drawer.dart';
import 'package:chatbot/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Settings"),
      ),
      // drawer: CompDrawer(),
      body: ListView(
        children: [
          ListTile(
            title: Text("Dark Theme"),
            trailing: CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context).isdark, 
              onChanged: (value){
                Provider.of<ThemeProvider>(context,listen: false).toggleTheme();                
              }
            ),
          ),
        ],
      )
    );
  }
}