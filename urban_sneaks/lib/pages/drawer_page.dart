import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget{
  late Function (int) navigateBottomBar;
  DrawerPage(this.navigateBottomBar,{super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[900],
        child: Padding( padding:EdgeInsets.symmetric(vertical: 20), child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Column(
                children:[ 
                  DrawerHeader(
                  child: Image.asset('lib/shoesImages/logo.png')
                  ),

                  GestureDetector(
                    child: ListTile(
                      iconColor: Colors.white,
                      leading: Icon(Icons.home),
                      title: Text("Home",style: TextStyle(color: Colors.white,),)
                    ),
                    onTap: ()=>{
                      navigateBottomBar(0),
                      Navigator.of(context).pop()
                    },
                  ),

                  GestureDetector(
                    child: ListTile(
                      iconColor: Colors.white,
                      leading: Icon(Icons.shopping_cart),
                      title: Text("Cart",style: TextStyle(color: Colors.white,),)
                    ),
                    onTap: ()=>{
                      navigateBottomBar(1),
                      Navigator.of(context).pop()
                    },
                  ),

                  GestureDetector(
                    child: ListTile(
                      iconColor: Colors.white,
                      leading: Icon(Icons.info),
                      title: Text("About",style: TextStyle(color: Colors.white,),)
                    ),
                    // onTap:,
                  ),
                ]
              ),
              
              GestureDetector(
                child: ListTile(
                  iconColor: Colors.white,
                  leading: Icon(Icons.logout),
                  title: Text("LogOut",style: TextStyle(color: Colors.white,),)
                ),
                // onTap:,
              ),
          ],
        ),
        ),
      );
  }
}