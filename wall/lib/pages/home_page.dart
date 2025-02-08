import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall/components/comp_drawer.dart';
import 'package:wall/components/comp_postbutton.dart';
import 'package:wall/components/comp_posttile.dart';
import 'package:wall/components/comp_textfield.dart';
import 'package:wall/services/database/firestore.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirestoreDatabase db=FirestoreDatabase();
  FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    TextEditingController _postController=TextEditingController();
    void postPost(){
      if(_postController.text.isNotEmpty && _postController.text.trim()!=""){
        String message = _postController.text.trim();
        db.addPost(message);
        _postController.clear();
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("W A L L")),
      ),
      drawer:CompDrawer(),

      body: Column(
        children: [
          // textfield box for user to type
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: CompTextfield(controller: _postController, hintText: "Say something...", obscureText: false)),
                CompPostbutton(onTap: postPost)
              ],
            ),
          ),
          SizedBox(height: 20,),
          // posts
          Expanded(
            child: StreamBuilder(
            stream: db.getPostsStream() , 
            builder: (context, snapshot){
              if (snapshot.hasError) {
                return Text("Something went wrong.");
              }
              else if(snapshot.connectionState==ConnectionState.waiting){
                return Center (child: CircularProgressIndicator(),);
              }
              else if(snapshot.hasData){
                var posts = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index){ 
                    return CompPosttile(post: posts[index]);
                  },
                ); 
              }
              else{
                return Text("No posts yet");
              }
            }
            ),
          ),
        ],
      ),
    );
  }
}