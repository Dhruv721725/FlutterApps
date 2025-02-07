import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in
  Future<UserCredential> signIn(String email, password)async{
    try {
    UserCredential userCredential= await  _auth
      .signInWithEmailAndPassword(
        email: email, 
        password: password
    );
    return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUp(String email, password)async{
    try {
      UserCredential userCredential= await  _auth
        .createUserWithEmailAndPassword(
          email: email, 
          password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut()async{
    await  _auth.signOut();
  }

  // get user
  User? get currentUser=>_auth.currentUser;

  // create a user documnet and collect them
  
}