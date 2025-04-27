import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sem_miniproject/services/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:sem_miniproject/services/notification_service.dart'; // <-- NEW: for background animation

class TravelPage extends StatefulWidget {
  final String from;
  final String to;
  final String startDay;
  final String lastDay;
  final String budget;
  final String people;
  final bool showSave;
  final String response;

  TravelPage({
    super.key,
    required this.from,
    required this.to,
    required this.startDay,
    required this.lastDay,
    required this.response,
    required this.showSave,
    required this.budget,
    required this.people,
  });

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  bool pressed = false;
  NotificationService notify = NotificationService();
  @override
  Widget build(BuildContext context) {
    List<String> resList = widget.response.split("\n\n");

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background animation
            Positioned.fill(
              child: Lottie.asset(
                'animation.json', // <-- Add a beautiful background animation
                fit: BoxFit.fitWidth,
                repeat: true,
              ),
            ),

            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),

                // Top buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),

                      // Save/Delete button
                      widget.showSave
                          ? ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade600,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              
                              onPressed: pressed? null: () {
                                FirestoreService _firestore = FirestoreService();
                                _firestore.addTravelPlan(
                                    widget.from, widget.to, widget.startDay, widget.lastDay, widget.budget, widget.people, widget.response);
                                notify.showNotification("Saved", "Your travel plan from ${widget.from} to ${widget.to} has succesfully saved.");
                                setState(() {
                                  pressed = true;
                                });
                              },
                              icon: Icon(Icons.save, color: Colors.white),
                              label: Text('Save', style: TextStyle(color: Colors.white)),
                            )
                          : ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red.shade600,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed:pressed? null:  () {
                                FirestoreService _firestore = FirestoreService();
                                _firestore.deleteTravelPlan(
                                    widget.from, widget.to, widget.startDay, widget.lastDay, widget.budget, widget.people, widget.response);
                                setState(() {
                                  pressed = true;
                                });
                                notify.showNotification("deleted", "Your travel plan from ${widget.from} to ${widget.to} has succesfully deleted.");
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.delete, color: Colors.white),
                              label: Text('Delete', style: TextStyle(color: Colors.white)),
                            ),
                    ],
                  ),
                ),

                // Big Image at top (Swiss Alps related)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'beach.jpg',
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),

                // Title
                Text(
                  "${widget.from} ➔ ${widget.to}",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                  ),
                ),
                SizedBox(height: 8),

                // Dates
                Text(
                  "From ${widget.startDay} to ${widget.lastDay}",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),

                // Travel Plan Details
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: resList.length,
                    itemBuilder: (context, index) {
                      String tt = resList[index].trim();
                      List<Widget> texts = [];

                      int n = tt.length;
                      int i = 0;
                      String ot = "";
                      while (i < n) {
                        if (i + 1 < n && tt[i] == "*" && tt[i + 1] == "*") {
                          texts.add(Text(ot.trim(), style: TextStyle(color: Colors.white70)));
                          ot = "";
                          String bt = "";
                          i += 2;
                          while (i + 1 < n && !(tt[i] == "*" && tt[i + 1] == "*")) {
                            bt += tt[i];
                            i++;
                          }
                          i += 2;
                          texts.add(Text(
                            bt.trim() + " ",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          ));
                        } else {
                          ot += tt[i];
                        }
                        i++;
                      }
                      texts.add(Text(ot.trim(), style: TextStyle(color: Colors.white70)));

                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.all(12),
                        child: ListTile(
                          title: Wrap(children: texts),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
