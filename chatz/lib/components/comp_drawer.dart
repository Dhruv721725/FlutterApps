import 'package:chatz/components/comp_drawer_tile.dart';
import 'package:chatz/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CompDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.message, size: 50, color: Theme.of(context).colorScheme.primary,)),
              Expanded(
                child: Column(
                  children: [
                    // CompDrawerTile(icon: Icon(Icons.search), text: "Search", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.home), text: "Home", onTap: (){ 
                      Navigator.pop(context);
                      }),
                    // CompDrawerTile(icon: Icon(Icons.file_download_done_sharp), text: "Media", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.info), text: "About", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.settings), text: "Settings", onTap: (){}),
                  ],
                ),
              ),
              CompDrawerTile(icon: Icon(Icons.logout), text: "Log Out", onTap: ()=>AuthService()..signOut()),
            ],
          ),
        )
    );
  }
}