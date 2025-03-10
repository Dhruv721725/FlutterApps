import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melflow/components/comp_drawer.dart';
import 'package:melflow/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S E T T I N G S"),
      ),
      drawer:  CompDrawer(),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              padding: EdgeInsets.all(8),
        
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Dark Theme",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,)),
                  CupertinoSwitch(
                    value: Provider.of<ThemeProvider>(context).isDark, 
                    onChanged: (value){
                      setState(() {
                        Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
                      });
                    }
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}