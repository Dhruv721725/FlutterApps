import 'package:chatz/auth/auth_service.dart';
import 'package:chatz/components/comp_drawer_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    void logOut(){
      AuthService()..signOut();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              DrawerHeader(child: Icon(Icons.message, size: 50, color: Theme.of(context).colorScheme.primary,)),
              Expanded(
                child: Column(
                  children: [
                    CompDrawerTile(icon: Icon(Icons.search), text: "Search", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.home), text: "Home", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.file_download_done_sharp), text: "Media", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.info), text: "About", onTap: (){}),
                    CompDrawerTile(icon: Icon(Icons.settings), text: "Settings", onTap: (){}),
                  ],
                ),
              ),
              CompDrawerTile(icon: Icon(Icons.logout), text: "Log Out", onTap: ()=>AuthService()..signOut()),
            ],
          ),
        ),
      ),     
    );
  }
}