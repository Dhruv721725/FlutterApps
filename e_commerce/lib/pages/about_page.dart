import 'package:e_commerce/components/comp_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("About Page🔥"),
        centerTitle: true,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer:CompDrawer(),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            Text(
              "Welcome to Minimal Shopping We’re here to make online shopping smarter, simpler, and more enjoyable! Designed and developed by a passionate developer, Dhruv Gupta, Minimal Shopping is crafted to bring you the best of e-commerce with a personal touch.",
              textAlign: TextAlign.center,
            ),
          
          ],
        ),
      ),
    );
  }
}