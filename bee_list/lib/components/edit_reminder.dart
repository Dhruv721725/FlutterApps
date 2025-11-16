import 'dart:ui';
import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class EditReminder extends StatefulWidget {
  String title;
  void Function(Reminder) onSave;
  DateTime? date;
  int? day;
  String? reminderTitle;
  String? reminderBody;
  TimeOfDay rmndrTm;
  bool isOn;

  EditReminder({
    super.key,
    required this.title,
    this.date,
    this.day,
    this.reminderTitle,
    this.reminderBody,
    required this.rmndrTm,
    required this.isOn,
    required this.onSave,
  });

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  
  late String selectedMode;
  late DateTime pickedDate;
  late int pickedDay;
  late TimeOfDay pickedTime;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  void initState() {
    selectedMode = widget.day==null? 'date' : 'day';
    pickedDate = widget.date??DateTime.now();
    pickedDay = widget.day??0;
    pickedTime = widget.rmndrTm;
    _title.text= widget.reminderTitle??"";
    _body.text= widget.reminderBody??"";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    String date = "${pickedDate.day} ${months()[pickedDate.month-1]}, ${pickedDate.year}";
    String time = pickedTime.format(context);
    return AlertDialog(
      insetPadding: EdgeInsets.all(4),
      icon: Icon(Icons.notifications),
      title: Text(widget.title),
      content:Column(
          children: [

// ---------------------------------------------------------
// -------- Title ------------------------------------------
// ---------------------------------------------------------

            TextField(
              maxLines: 1,
              selectionWidthStyle: BoxWidthStyle.tight,
              controller: _title,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                hint: Text("Enter title..."),
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),

            SizedBox(height: 8,),


// ---------------------------------------------------------
// -------- Content ----------------------------------------
// ---------------------------------------------------------

            TextField(
              maxLines: 3,
              controller: _body,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                hint: Text("Enter content..."),
                filled: true,
                fillColor: Theme.of(context).colorScheme.primary,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
                  borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
            
            SizedBox(height: 8,),

// ---------------------------------------------------------
// -------- Day/Date ---------------------------------------
// ---------------------------------------------------------

            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'day', label: Text('Day')),
                ButtonSegment(value: 'date', label: Text('Date')),
              ],
              selected: {selectedMode},
              onSelectionChanged: (newSelection) {
                setState(() {
                  selectedMode = newSelection.first;
                });
              },
            ),

            SizedBox(height: 8,),

            if(selectedMode == 'date')...[
              ListTile(
                title: Text(date),
                trailing: IconButton(
                  onPressed: ()async{
                    final picked =await showDatePicker(
                      context: context, 
                      firstDate: DateTime.now(), 
                      lastDate: DateTime(DateTime.now().year+5),
                      initialDate: pickedDate
                    );
                    if (picked!=null) {
                      setState(() {
                        pickedDate = picked;
                      });
                    }
                  }, 
                  icon: Icon(Icons.calendar_month)),
              )
            ]else...[
              DropdownButton<int>(
                borderRadius: BorderRadius.circular(12),
                padding: EdgeInsets.all(4),
                value: pickedDay,
                items: List.generate(8, 
                  (i)=>DropdownMenuItem(
                    value: i,
                    child: Text(weekDays()[i])
                  )
                ),
                onChanged: (value) {
                  setState(() {pickedDay = value??0;});
                },
              ),
            ],

            SizedBox(height: 8,),

// ---------------------------------------------------------
// -------- Time -------------------------------------------
// ---------------------------------------------------------

            Text("Choose the reminder time:"),
            ListTile(
              title: Text(time),
              trailing: IconButton(
                onPressed: ()async{
                  TimeOfDay? rmndrTime = await showTimePicker(
                    context: context, 
                    initialTime: pickedTime,
                  );
                  if (rmndrTime!=null) {
                    setState(() {
                      pickedTime = rmndrTime;
                    });
                  }
                }, 
                icon: Icon(Icons.alarm)
              ),
            )
          ],
        ),

      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ActionChip(
          label:Text("Save"),
          onPressed: (){
            Reminder reminder = Reminder(
              title: _title.text, 
              body: _body.text, 
              hr: pickedTime.hour,
              min: pickedTime.minute, 
              isOn: true, 
              date: selectedMode=='date'? pickedDate:null,
              day:selectedMode=='day'? pickedDay:null,
            );
            widget.onSave(
              reminder
            );
          }, 
        ),
        
        ActionChip(
          label:Text("Cancel"),
          onPressed: ()=>Navigator.pop(context), 
        )
      ],
      scrollable: true,
    );
  }
}