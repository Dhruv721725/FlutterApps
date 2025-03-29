import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sem_miniproject/components/comp_textfield.dart';
import 'package:sem_miniproject/components/generate_plan_button.dart';
import 'package:table_calendar/table_calendar.dart';

class CreationPage extends StatefulWidget {
  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  TextEditingController destination=TextEditingController();
  TextEditingController location=TextEditingController();
  TextEditingController start=TextEditingController();
  TextEditingController end=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController people=TextEditingController();
  TextEditingController specs=TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool dark_mode=true;

  List<String> activities = [
    "Shopping","Nature","Skyscrappers","Cuisines", "Adventure", "Culture", "Entertainment", "Relax", "Unwind"
  ];
  Set<int> _selectedIndices={};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amount.value = TextEditingValue(text:"3000");
    people.value = TextEditingValue(text: "1");
  }

  @override
  Widget build(BuildContext context) {
    start.value=TextEditingValue(text: "${DateFormat('MMMM dd, yyyy').format(startDate)}");
    end.value=TextEditingValue(text: "${DateFormat('MMMM dd, yyyy').format(endDate)}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  // heading
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.arrow_back)),
                      
                      Text("Travo Genie", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                          
                  // guide text
                  Text(
                    "Fill out the information below in order to help us guide you better.", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary
                    ),
                    textAlign: TextAlign.start,
                  ), 
                  SizedBox(height: 20,),
                  
                  // Total no. of people
                          
                  SizedBox(height: 20,),

                  Text("Enter the total no. of people.", textAlign: TextAlign.start,),
                  CompTextfield(
                    controller: people,
                    hintText: "People...",
                  ),
                          
                  SizedBox(height: 20,),

                  // location text
                  Text("Enter your current location.", textAlign: TextAlign.start,),
                  CompTextfield(
                    controller: location,
                    hintText: "Current Location...",
                  ),
                          
                  SizedBox(height: 20,),

                  // destination text
                  Text("Enter your destination.", textAlign: TextAlign.start,),
                  CompTextfield(
                    controller: destination,
                    hintText: "Destination...",
                  ),
                          
                  SizedBox(height: 20,),
                  Text(
                    "Enter the duration",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 10,),
                          
                  // start date
                  Text(
                    "Starting Date",
                    textAlign: TextAlign.start,
                  ),
                          
                  TableCalendar(
                    focusedDay: startDate, 
                    firstDay: DateTime(2000), 
                    lastDay: endDate,
                    calendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    selectedDayPredicate: (day) => isSameDay(startDate, day),
                    calendarStyle: CalendarStyle(
                      
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        startDate = selectedDay;
                      });
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, // Hide the month format button
                    ),
                  ),
                          
                  CompTextfield(
                    controller: start,
                    readOnly: true,
                    hintText: "Start Date...",
                  ),
                  SizedBox(height: 20,),
                          
                  // End date
                  Text(
                    "Ending Date",
                    textAlign: TextAlign.start,
                  ),
                          
                  TableCalendar(
                    focusedDay: endDate, 
                    firstDay: DateTime(2000), 
                    lastDay: DateTime(2100),
                    calendarFormat: CalendarFormat.week,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    selectedDayPredicate: (day) => isSameDay(endDate, day),
                          
                    calendarStyle: CalendarStyle(
                      rangeHighlightColor: Colors.green
                    ),
                          
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        endDate = selectedDay;
                      });
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false, // Hide the month format button
                    ),
                  ),
                          
                  CompTextfield(
                    controller: end,
                    readOnly: true,
                    hintText: "Start Date...",
                  ),
                  SizedBox(height: 20,),
                          
                  // budget
                  Text("Specify your budget in(INR) for the journey."),
                  
                  CompTextfield(
                    controller: amount, 
                    hintText: "Amount..."
                  ),
                  SizedBox(height: 20,),
                          
                  // Interests / Activities
                  Text(
                    "Interests/Activities",
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Text(
                    "Please select the activities you wants to add to your travel plan.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color:Theme.of(context).colorScheme.secondary 
                    ),
                  ),
                  SizedBox(height: 10,),
                  /*
                  C H O I C E
                  C H I P S
                  H E R E 
                  */
                  Wrap(
                    spacing: 10.0, // Space between chips
                    runSpacing: 10.0, // Space between lines
                    children: List.generate(
                      activities.length, 
                      (index){
                        return ChoiceChip(
                          label: Text(activities[index]), 
                          selected: _selectedIndices.contains(index),
                          onSelected: (bool selected) {
                            if (!_selectedIndices.contains(index)) {
                              _selectedIndices.add(index);
                            }else{
                              _selectedIndices.remove(index);
                            }
                            setState(() {});
                          },
                        );
                      }
                    )
                  ),
                  
                //  other perks      
                  SizedBox(height: 20,),

                  Text("Other Specifications.", textAlign: TextAlign.start,),
                  CompTextfield(
                    controller: specs,
                    hintText: "Constraints"
                  ),

                  SizedBox(height: 20,),                  
                  // Generate plan button
                  GeneratePlanButton(
                    from: location,
                    to: destination,
                    start: start,
                    last: end,
                    budget: amount,
                    activities: activities,
                    selectedIndices:_selectedIndices,
                    people:people,
                    specs:specs,
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}