import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CompPosttile extends StatelessWidget{
  var post;
  CompPosttile({
    super.key,
    required this.post,
  });
  @override
  Widget build(BuildContext context) {
    Timestamp t= post["timestamp"];
    String timeStamp;
    if(Timestamp.now().toDate().difference(t.toDate()).inHours==0){
      timeStamp=Timestamp.now().toDate().difference(t.toDate()).inMinutes.toString()+ " min ago";
    }
    else if(Timestamp.now().toDate().difference(t.toDate()).inDays<=1){
      timeStamp=Timestamp.now().toDate().difference(t.toDate()).inHours.toString()+ " hr ago";
    }
    else if(Timestamp.now().toDate().difference(t.toDate()).inDays<=7){
      timeStamp=Timestamp.now().toDate().difference(t.toDate()).inDays.toString()+" days ago";
    }else{
      timeStamp=Timestamp.now().toDate().difference(t.toDate()).toString().split(" ")[0];
    }
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
       title: Text(
        post["post"], 
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
       subtitle: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text(post["userEmail"]),
           Text(
            timeStamp,
            style: GoogleFonts.nunito(
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            )
        ],
       ),
      ),
    );
  }
}