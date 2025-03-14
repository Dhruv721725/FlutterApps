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
            .collection("user_details")
            .add({
                "name":name,
                "email":email,
                "pass":pass,
                "darkTheme":false
            });
        } catch (e) {
          print(e);
        }
    }

    Future<void> addMessage(String text, String type)async{
        try {
          await _firestore.collection("users")
            .doc(_auth.currentUser!.uid)
            .collection("chat_room")
            .add({
                "type":type,
                "text":text,
            });
        } catch (e) {
          print(e);
        }
    }
}