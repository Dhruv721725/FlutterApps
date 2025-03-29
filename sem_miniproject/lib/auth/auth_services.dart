import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth _auth=FirebaseAuth.instance;

  Future <User?> login(String email, String password)async{
    try {
      UserCredential _userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? _user=_userCredential.user;
      return _user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future <User?> register(String email, String password)async{
    try {
      UserCredential _userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? _user=_userCredential.user;
      return _user;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  void logOut()async{
    await _auth.signOut();
  }
}