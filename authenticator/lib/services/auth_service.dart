import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  //  google sign in
  void signInWithGoogle()async{
    // begin interactive sign in process
    final GoogleSignInAccount? gUser=await GoogleSignIn().signIn(); 
    
    // obtain auth details from request
    final GoogleSignInAuthentication gAuth=await gUser!.authentication;

    // create a new credential for User
    final credential= GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    // finally lets sign in
  }
}