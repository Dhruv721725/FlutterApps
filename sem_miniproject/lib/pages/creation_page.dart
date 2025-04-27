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
  TextEditingController destination = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController people = TextEditingController();
  TextEditingController specs = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  Set<int> _selectedIndices = {};

  List<String> activities = [
    "Shopping", "Nature", "Skyscrapers", "Cuisines", 
    "Adventure", "Culture", "Entertainment", "Relax", "Unwind"
  ];

  @override
  void initState() {
    super.initState();
    amount.text = "3000";
    people.text = "1";
  }

  @override
  Widget build(BuildContext context) {
    start.text = DateFormat('MMMM dd, yyyy').format(startDate);
    end.text = DateFormat('MMMM dd, yyyy').format(endDate);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context), 
                  icon: Icon(Icons.arrow_back)
                ),
                Text(
                  "Travo Genie",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Fill out the details to personalize your travel experience!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),

            _buildSection(
              title: "People and Location",
              child: Column(
                children: [
                  _buildFieldLabel("Total No. of People"),
                  CompTextfield(controller: people, hintText: "People..."),
                  SizedBox(height: 10),
                  _buildFieldLabel("Current Location"),
                  CompTextfield(controller: location, hintText: "Current Location..."),
                  SizedBox(height: 10),
                  _buildFieldLabel("Destination"),
                  CompTextfield(controller: destination, hintText: "Destination..."),
                ],
              ),
            ),

            _buildSection(
              title: "Travel Dates",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFieldLabel("Starting Date"),
                  _buildCalendar(startDate, (selectedDay) {
                    setState(() {
                      startDate = selectedDay;
                    });
                  }),
                  CompTextfield(controller: start, hintText: "Start Date...", readOnly: true),
                  SizedBox(height: 10),
                  _buildFieldLabel("Ending Date"),
                  _buildCalendar(endDate, (selectedDay) {
                    setState(() {
                      endDate = selectedDay;
                    });
                  }),
                  CompTextfield(controller: end, hintText: "End Date...", readOnly: true),
                ],
              ),
            ),

            _buildSection(
              title: "Budget",
              child: Column(
                children: [
                  _buildFieldLabel("Estimated Budget (INR)"),
                  CompTextfield(controller: amount, hintText: "Amount..."),
                ],
              ),
            ),

            _buildSection(
              title: "Activities",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose what you would love to do!",
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      activities.length,
                      (index) => ChoiceChip(
                        label: Text(activities[index]),
                        selected: _selectedIndices.contains(index),
                        selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedIndices.add(index);
                            } else {
                              _selectedIndices.remove(index);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            _buildSection(
              title: "Other Specifications",
              child: Column(
                children: [
                  _buildFieldLabel("Constraints / Special Requests"),
                  CompTextfield(controller: specs, hintText: "Constraints"),
                ],
              ),
            ),

            SizedBox(height: 20),
            GeneratePlanButton(
              from: location,
              to: destination,
              start: start,
              last: end,
              budget: amount,
              activities: activities,
              selectedIndices: _selectedIndices,
              people: people,
              specs: specs,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Custom Section builder
  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  // Custom field label
  Widget _buildFieldLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  // Calendar widget
  Widget _buildCalendar(DateTime date, void Function(DateTime) onDaySelected) {
    return TableCalendar(
      focusedDay: date,
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: (day) => isSameDay(date, day),
      onDaySelected: (selectedDay, _) => onDaySelected(selectedDay),
      headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
