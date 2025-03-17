import 'package:flutter/material.dart';
import 'package:ntfr/noti_service.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            NotiService().showNotification(
              title: "Notifier",
              body: "hi notification from notifier"
            );
          },
          child: Text("Send Notification")
        ),
      ),
    );
  }
}
