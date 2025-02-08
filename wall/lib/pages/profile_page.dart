import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wall/components/comp_backbutton.dart';
import 'package:wall/components/comp_drawer.dart';

class ProfilePage extends StatelessWidget{
  
  // current logged in user
  User? _user= FirebaseAuth.instance.currentUser;
  
  // future for fetching users data
  Future <DocumentSnapshot<Map<String,dynamic>>> getUserDetails()async{
    return await FirebaseFirestore.instance
      .collection("Users")
      .doc(_user!.email)
      .get();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      // ),
      drawer: CompDrawer(),

      body: FutureBuilder(
        future: getUserDetails(), 
        builder: (context,snapshot){
          // loading ...
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // error
          else if(snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }

          // data recieved
          else if(snapshot.hasData){
            // extract data
            Map<String, dynamic>? userData=snapshot.data!.data();
            return Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CompBackbutton(),
                      ],
                    ),
                  ),

                  SizedBox(height: 50,),

                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(25),
                    child: Icon(Icons.person, size: 50),
                  ),
                  SizedBox(height: 25,),
                  
                  Text(userData!["userName"],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
                  Text(
                    userData["email"],
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary
                    )
                  ),
                ],
              ),
            );
          }
          else{
            return Text("No data");
          }
        }
      ),
    );
  }
}