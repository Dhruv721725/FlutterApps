
/*
  Each post contains 
  post info
  email of sender
  timestamp
*/ 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current user
  User? user=FirebaseAuth.instance.currentUser;

  // get collection of posts from firebase
  final CollectionReference posts= FirebaseFirestore.instance.collection("Posts");

  // post a message
  Future<void> addPost(String message){
    return posts.add({
      "userEmail": user!.email,
      "post": message,
      "timestamp":Timestamp.now(),
      }
    );
  }

  // readin posts
  Stream<QuerySnapshot> getPostsStream(){
    final postStream=FirebaseFirestore.instance
                      .collection("Posts")
                      .orderBy("timestamp", descending: true)
                      .snapshots();
    return postStream;
  }

}