import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:light_dark/pages/box.dart';
import 'package:light_dark/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("Mode 🔥"),
        backgroundColor: Colors.transparent,
      ),

      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.primary, 
          child: IconButton(
            onPressed: (){
              Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
            }, 
            icon: Icon(Icons.lightbulb),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
            ),
          )
        ),
      ),
    );
  }
}