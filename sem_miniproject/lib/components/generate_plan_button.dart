import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sem_miniproject/pages/travel_page.dart';
import 'package:sem_miniproject/services/gemini_api.dart';

class GeneratePlanButton extends StatefulWidget {
  TextEditingController from;
  TextEditingController to;
  TextEditingController start;
  TextEditingController last;
  TextEditingController budget;
  List<String> activities;
  Set<int> selectedIndices;
  TextEditingController people;
  TextEditingController specs;

  GeneratePlanButton({
    super.key,
    required this.from,
    required this.to,
    required this.start,
    required this.last,
    required this.budget,
    required this.activities,
    required this.selectedIndices,
    required this.people,
    required this.specs,
  });

  @override
  State<GeneratePlanButton> createState() => _GeneratePlanButtonState();
}

class _GeneratePlanButtonState extends State<GeneratePlanButton> {
  Widget child = Text("Generate Plan", style: TextStyle(fontSize: 20),);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(200, 50)
      ),
      onPressed: (){
        String interests = "";
        for (var index in widget.selectedIndices) {
          interests+= widget.activities[index]+", ";
        }

        String prompt = """
          Generate a travel plan for 
          ${widget.people.text} from location
          ${widget.from.text} to destination
          ${widget.to.text}, under the budget of
          ${widget.budget.text} indian rupees from 
          ${widget.start.text} to 
          ${widget.last.text} with activities including
          ${interests} ,
          ${widget.specs.text} 
          in brief.
          """;
          
        setState(() {
          String data = "No data available";
          child = FutureBuilder(
            future: GeminiApi().geminiResponse(prompt), 
            builder: (context,snapshot){
              if (snapshot.connectionState==ConnectionState.waiting) {
                return CircularProgressIndicator();
              }else{
                data = snapshot.data!;
                WidgetsBinding.instance.addPostFrameCallback((_){
                  Navigator.push(
                    context,MaterialPageRoute(
                      builder:(context)=>TravelPage(
                        from: widget.from.text, 
                        to: widget.to.text, 
                        startDay: widget.start.text, 
                        lastDay: widget.last.text, 
                        budget: widget.budget.text,
                        showSave: true,
                        response: data,
                        people: widget.people.text,
                      )
                    )
                  );
                });
                return Text("Generate Plan", style: TextStyle(fontSize: 20),);
              }
            }
          );
        });
      }, 

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      )
    );
  }
}