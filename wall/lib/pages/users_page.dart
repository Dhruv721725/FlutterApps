import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wall/components/comp_drawer.dart';
import 'package:wall/components/comp_functions.dart';

class  UsersPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      drawer: CompDrawer(),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(), 
        builder: (context, snapshot){
          // errors
          if(snapshot.hasError){
            warning("Something went wrong", context);
          }
          // show loading circle
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator()); 
          }
          // get all users
          if(snapshot.data==null){
            return Text("No Data");
          }
          final users =snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, count){
              final user=users[count];

              return ListTile(
                title: Text(user["userName"]),
                subtitle:Text(user["email"]),
              );
            }
          );
        }
      ),
    );
  }
}