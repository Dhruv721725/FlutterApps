import 'package:flutter/material.dart';
import 'package:urban_sneaks/components/bottom_nav_bar.dart';
import 'package:urban_sneaks/pages/cart.dart';
import 'package:urban_sneaks/pages/drawer_page.dart';
import 'package:urban_sneaks/pages/shop.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  final List<Widget> _pages=[
     ShopPage(),
     CartPage(),
  ];

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Row(
          children: [
            Text("Urban Sneaks",),
            Image.asset(
              'lib/shoesImages/logo.png',
              height: 30,
              ),
          ],
        ),
      ),
      drawer: DrawerPage(navigateBottomBar),

      backgroundColor: Colors.grey[300],
      
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25), 
        child: _pages[_selectedIndex]
        ),
      
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) =>navigateBottomBar(index),
        selectedIndex: _selectedIndex,
      ),
    );
  }
}