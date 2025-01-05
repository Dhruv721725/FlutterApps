import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/pages/drawer_page.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      drawer: DrawerPage(),

      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.edit,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Text(
              "Welcome to Notes app We’re here to make note making smarter, simpler, and more enjoyable! Designed and developed by a passionate developer, Dhruv Gupta, Minimal Notes app is crafted to bring you the best of your \"notes\" with a personal touch.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                // fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
          ],
        ),
      ),
    );
  }
}