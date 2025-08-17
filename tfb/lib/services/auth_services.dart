import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String name, String email, String pass)async{
    try {
      UserCredential? _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
      User? _user = _userCredential.user;
      await _user?.updateDisplayName(name);
      return _user;

    } on FirebaseAuthException catch(e) { 
      print("Error");
      throw Exception(e.code);
    }
  }

  Future<User?> logIn(String email, String pass)async{
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? _user = _userCredential.user;
      return _user;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); 
    } 
  }

  Future<void> resetPassword(String email)async{
    try {
      await _auth.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    } 
  } 

  Future<User?> google_SignIn()async{
    try {
      if (kIsWeb) {
        UserCredential _user = await _auth.signInWithPopup(GoogleAuthProvider()); 
        return _user.user;
      }else{
        GoogleSignInAccount? _acc = await GoogleSignIn().signIn();
        GoogleSignInAuthentication? googleAuth = await _acc?.authentication; 
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken
        );
        await _auth.signInWithCredential(credentials);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<User?> appleSignIn()async{
    
  } 

  Future<User?> getUser()async=> await _auth.currentUser;

  void logOut()async{
    await _auth.signOut();
  }

}