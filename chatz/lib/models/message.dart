
import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  final String senderID;
  final String senderEmail;
  final String receiverID;
  final String message;
  final Timestamp timeStamp;

  const Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timeStamp,
  });
  Map<String, dynamic> toMap(){
    return {
      "senderID":this.senderID,
      "senderEmail":this.senderEmail,
      "receiverID":this.receiverID,
      "message":this.message,
      "timeStamp":this.timeStamp,
    };
  }
}