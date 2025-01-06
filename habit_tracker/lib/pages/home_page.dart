import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habit_tracker/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: CupertinoSwitch(
          value: context.watch<ThemeProvider>().isDark, 
          onChanged:(val){
            setState(() {
              Provider.of<ThemeProvider>(context,listen: false).toggleMode();
            });
          }  
        ),
      ),
      // body: Center(
      //   child: ,
      // ),
    );
  }
}