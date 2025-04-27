import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sem_miniproject/pages/travel_page.dart';

class CompTravelTile extends StatelessWidget{
  String destination;
  String start;
  String end;
  String budget;
  String people;
  String response;
  CompTravelTile({
    super.key,
    required this.destination,
    required this.start,
    required this.end,
    required this.budget,
    required this.people,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // switch to travel page
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TravelPage(
          from: destination.split("to")[0].trim(), 
          to: destination.split("to")[1].trim(), 
          startDay: start, 
          lastDay: end, 
          response: response, 
          showSave: false, 
          budget: budget, 
          people: people)
        ));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade800, Colors.black87],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Destination:",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            Text(
              destination,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12),
            
            Row(
              children: [
                Icon(Icons.calendar_today, size: 18, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  "From: ",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  start,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.arrow_downward, size: 18, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  "To: ",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                Text(
                  end,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}