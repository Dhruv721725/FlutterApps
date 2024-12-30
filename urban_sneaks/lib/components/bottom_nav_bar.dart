import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget{
  void Function(int)? onTabChange;
  int selectedIndex;
  BottomNavBar({required this.onTabChange, required this.selectedIndex ,super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical:20),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.center,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.white,
        color: Colors.grey[500],
        tabBorderRadius: 10,

        onTabChange: (value) => onTabChange!(value) ,
        selectedIndex: selectedIndex,

        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
            ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Cart",
            )
        ] 
        ),
    );
  }
}