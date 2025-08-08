import 'package:flutter/material.dart';
import 'package:tfb/services/auth_services.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "T F B",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              AuthServices()..logOut();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.logout, 
                color:Theme.of(context).colorScheme.onPrimary ,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: AuthServices().getUser(),
          builder: (context,snapshot) {
            String name;
            if (snapshot.connectionState==ConnectionState.waiting) {
              return CircularProgressIndicator();
            }else{
              return Text(
                "Hi! ${snapshot.hasData? snapshot.data?.displayName: "stranger"}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              );
            }
          }
        ),
      ),
    );
  }
}