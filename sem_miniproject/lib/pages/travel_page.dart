import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TravelPage extends StatelessWidget{
  String from;
  String to;
  String startDay;
  String lastDay;
  String budget;

  String response;

  TravelPage({
    super.key,
    required this.from,
    required this.to,
    required this.startDay,
    required this.lastDay,
    required this.budget,
    required this.response,
  });
  @override
  Widget build(BuildContext context) {
    List<String> resList = response.split("\n\n");

    return SafeArea(child: Scaffold(
      body: Container(
        // background image
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.alphaBlend(Colors.black.withAlpha(128), Colors.transparent), 
              BlendMode.darken,
            )
          ),
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            // destination
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black54
                    ),
                    onPressed: ()=>Navigator.pop(context), 
                    child: Icon(Icons.arrow_back,color: Colors.white,)
                  ),
                ],
              ),
            ),
            Text(
              "${from} to ${to}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            
            // timing
            Text(
              "From ${startDay} to ${lastDay}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
        
            // budget
            Text(
              "Budget: ${budget}",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10,),
        
            // response
            Expanded(
              child: ListView.builder(
                itemCount:resList.length,
                itemBuilder: (context,index){      
                  // bolding texts
                  String tt = resList[index].trim();
                  List<Widget> texts = [];
                  
                  int n = tt.length;
                  int i=0;
                  String ot="";
                  while (i<n) {
                    if(i+1<n && (tt[i]=="*" && tt[i+1]=="*")){
                      texts.add(Text(ot.trim()));
                      ot="";
                      String bt = "";
                      i+=2;
                      while (i+1<n && !(tt[i]=="*" && tt[i+1]=="*")) {
                        bt+=tt[i];
                        i++; 
                      }
                      i+=2;
                      texts.add(Text(bt.trim()+" ",style: TextStyle(fontWeight: FontWeight.bold),));

                    }else{
                      ot+=tt[i];
                    }
                    i++;
                  }
                  texts.add(Text(ot.trim()));
                  ot="";

                  return Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                      title: Wrap(
                        children: texts,
                      )
                    ),
                  );
                }
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    ));
  }
}