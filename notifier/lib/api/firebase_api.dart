import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  // instance of firbase api
  final _firebaseMessaging= FirebaseMessaging.instance;
 
  // function to initialize notification
  Future<void> initNotificaion()async{
    // request permission from user
    await _firebaseMessaging.requestPermission();

    // fetch the fcm token for the device
    final fcmToken= await _firebaseMessaging.getToken();

    // print token normally sending oit to server
    print('Token: '+fcmToken.toString());
    
  }
  // function to handle received messages

  // 
}