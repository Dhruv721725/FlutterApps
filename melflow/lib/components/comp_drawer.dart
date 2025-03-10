import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // drawer header
          DrawerHeader(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.music_note,size: 50,),
                  Text("M E L F L O W",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ))
                ],
              ),
            ),  
          ),

          // Home tile
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, '/home'),
            child: ListTile(
              leading: Icon(Icons.home,),
              title: Text("H O M E"),
            ),
          ),

          // settings tile
          GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, '/settings'),
            child: ListTile(
              leading: Icon(Icons.settings,),
              title: Text("S E T T I N G S"),
            ),
          )
        ],
      ),
    );
  }
}