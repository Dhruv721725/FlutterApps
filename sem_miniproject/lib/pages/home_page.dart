import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sem_miniproject/components/comp_travel_tile.dart';
import 'package:sem_miniproject/pages/creation_page.dart';
import 'package:sem_miniproject/services/firestore.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    FirestoreService _firestore =FirestoreService();
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("assets/launcher_icon.png", height: 30,),
            SizedBox(width: 16,),
            Text("TravoGenie"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth _auth = FirebaseAuth.instance;
              _auth.signOut();
            }, 
            icon: Icon(Icons.logout)
          )
        ],
      ),

      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
            image:AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.colorBurn) 
          )
        ) ,

        child: Column(
          children: [
            // tile redirecting to form
            Expanded(
              child: GestureDetector(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: 
                (context)=>CreationPage(),
                )),
                child: Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black54
                  ),
                      
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Plan Your Travel Now.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        Text(
                          """TravoGenie's Ai helper is here to create your own travel plan, in just few clicks with all your constraints and demands.""" 
                        ),
                        
                        Row(
                          children: [
                            Text("So Plan Now ", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            Icon(Icons.arrow_forward)                          
                          ],
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ),
        
            SizedBox(height: 20,),
        
            // Suggested travel plans (customize these travel plans to make them urs)          
        
            // users travel plans
            Container(
              margin: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your Travel Plans.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your all the saved \"Travel Plans\" will appear here.",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
        
            Expanded(
              flex: 2,
              child:Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(8),

                // fetching data from firestore and using it
                child: StreamBuilder(
                  stream: _firestore.getTravelPlans(), 
                  builder: (context,snapshot){
                    print(snapshot.connectionState);
                    if (snapshot.connectionState==ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }else if(snapshot.hasData){
                      List<dynamic> travelPlans = snapshot.data!.get("travelPlans");
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: travelPlans.length,
                        itemBuilder: (comtext,index){
                          final travelPlan = travelPlans[index];
                          if (travelPlan.length>0) {
                            return GestureDetector(
                              child: CompTravelTile(
                                destination: "${travelPlan["location"]} to ${travelPlan["destination"]}", 
                                start: "${travelPlan["start"]}", 
                                end: "${travelPlan["end"]}", 
                                budget: "${travelPlan["budget"]}", 
                                people: "${travelPlan["people"]}", 
                                response: "${travelPlan["travel_plan"]}",
                              ),
                            );
                          }else{
                            return Center(
                              child: Text("You do not have any \"Travel Plans\" yet."),
                            );
                          }
                        }
                      );
                    }else{
                      return Center(
                        child: Text("Error in fetching data"),
                      );
                    }
                  
                  }
                ),
              ),
            )          
          ],
        ),
      ),
    ));
  }
}