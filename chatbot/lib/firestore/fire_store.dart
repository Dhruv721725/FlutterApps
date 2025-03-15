import 'package:chatbot/theme/lightmode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    FirebaseAuth _auth = FirebaseAuth.instance; 
    Future<void> adduser(String name, String email, String pass)async{
        try {
          await _firestore.collection("users")
            .doc(_auth.currentUser!.uid)
            .set({
                "name":name,
                "email":email,
                "pass":pass,
                "darkTheme":false,
                "queries":[],
            });
        } catch (e) {
          print(e);
        }
    }

    Future<String> getName()async{
        try {
          var query = await _firestore.collection("users")
            .doc(_auth.currentUser!.uid)
            .get();
          String name= query.data()!["name"];
          return name;
        } catch (e) {
          return "_";
        }
    }
    
}