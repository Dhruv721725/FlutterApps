import 'package:bee_list/data.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget{
  final String text;
  NotificationPage({
    super.key,
    required this.text,
  });

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late List<Map<String, dynamic>> notifications;
  @override 
  void initState() {
    notifications = Data[widget.text]!["Notifications"]!; 
    super.initState();
  } 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.text),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, id){
          
          return Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.fromLTRB(8,0,8,4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12)
            ),
            child: ListTile(
              title: Text(notifications[id]["text"]),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(notifications[id]["day"]),
                  Text(
                    "${notifications[id]["hr"]}:${notifications[id]["min"]}" 
                  ),
                ],      
              ),
            ),
          );

        }
      ),
    );
  }
}