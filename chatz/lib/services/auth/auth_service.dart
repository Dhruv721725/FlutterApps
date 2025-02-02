import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  AuthService();

  // instance of auth
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  // sign in
  Future<UserCredential> signInEmail(String email, password)async{
    try {
      UserCredential userCredential = 
        await  _auth.signInWithEmailAndPassword(email: email, password: password);
      
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email':userCredential.user!.email,
      });
      
      return userCredential;
    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpEmail(String email, password)async{
    try {
      // create user
      UserCredential userCredential=
        await _auth.createUserWithEmailAndPassword(
          email: email, 
          password: password
        );

      // save user info in a separate document
      _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email':userCredential.user!.email,
      });
      return userCredential;
    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut()async{
    return _auth.signOut();
  }

  // get user
  User? getCurrentUser ()=> _auth.currentUser;

  // errors


}