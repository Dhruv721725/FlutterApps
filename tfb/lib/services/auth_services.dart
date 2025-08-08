import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
      await _user?.reload();
      return _user;

    } on FirebaseAuthException catch (e) {
      throw Exception(e.code); 
    } 
  }

  Future<User?> getUser()async=> await _auth.currentUser;

  void logOut()async{
    await _auth.signOut();
  }

}