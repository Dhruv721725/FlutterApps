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
        padding:EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54,
        ),
      
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Destination
            Text(
              "Destination: ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            
            Text(
              destination,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8,),
            // Dates
            
            Text(
              "From ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            Text(
              start,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            
            // end date
            Text(
              " to ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              end,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8,),
      
            // Budget
            Text(
              "Budget: ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            Text(
              "INR "+budget,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),

            SizedBox(height: 8,),
      
            // people
            Row(
              children: [
                Text(
                  "For "
                ),
                Text(
                  people,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),Text(
                  " number of persons."
                ),
              ],
            ),
          ],
        ) ,
      ),
    );
  }
}