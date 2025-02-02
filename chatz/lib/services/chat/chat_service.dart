import 'package:chatz/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{
  ChatService();
  // get instance of firestor
  final FirebaseFirestore _firestore= FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // get user streams
  Stream<List<Map<String,dynamic>>> getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        // go through each individual user
        final user=doc.data();
        // return user
        return user;
      }).toList();
    });
  }

  // send message 
  Future <void> sendMessage(String receiverID, message)async{
    // current user info
    final String currentUserId=_auth.currentUser!.uid;
    final String currentUserEmail=_auth.currentUser!.email!;
    final Timestamp timeStamp=Timestamp.now();

    // create a new message
    Message newMessage= Message(
      senderID: currentUserId, 
      senderEmail: currentUserEmail, 
      receiverID: receiverID, 
      message: message, 
      timeStamp: timeStamp
    );
    // construct chat room id for the two users
    List<String> ids=[currentUserId, receiverID];
    ids.sort(); // this would ensure same chat room.
    String chatRoomId=ids.join("_");
    
    // add new message to database
    await _firestore
      .collection("chat_rooms")
      .doc(chatRoomId)
      .collection("messages")
      .add(newMessage.toMap());
  }

  // get message
  Stream<QuerySnapshot> getMessages(String userId, otherUserId){
    // construct a chatroom id for two users
    List<String> ids=[userId, otherUserId];
    ids.sort(); // to ensure same chatroom for both
    String chatRoomID=ids.join("_");
    
    return _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("messages")
      .orderBy("timeStamp",descending: false)
      .snapshots();
  }
}


  /*
  List<Map<String, Dynamic>>=

  [{
    "email": t1@gmail.com,
    "id": ---
  },
  {
    "email": t1@gmail.com,
    "id": ---
  },
  {
    "email": t1@gmail.com,
    "id": ---
  },]
  */