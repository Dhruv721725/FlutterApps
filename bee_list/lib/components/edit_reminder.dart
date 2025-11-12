import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditReminder extends StatefulWidget {
  String title;
  TextEditingController titleController;
  TextEditingController bodyController;
  void Function() onSave;
  DateTime? date;
  int? day;
  int hr;
  int min;

  EditReminder({
    super.key,
    required this.title,
    required this.titleController,
    required this.bodyController,
    this.date,
    this.day,
    required this.hr,
    required this.min,
    required this.onSave,
  });

  @override
  State<EditReminder> createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminder> {
  
  late String selectedMode;
  late DateTime pickedDate;
  late int pickedDay;

  @override
  void initState() {
    selectedMode = widget.day==null? 'date' : 'day';
    pickedDate = widget.date??DateTime.now();
    pickedDay = widget.day??0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    String date = "${pickedDate.day} ${months()[pickedDate.month-1]}, ${pickedDate.year}";
   
    return AlertDialog(
      insetPadding: EdgeInsets.all(4),
      icon: Icon(Icons.notifications),
      title: Text(widget.title),
      content:Column(
          children: [
            TextField(
              maxLines: 1,
              controller: widget.titleController,
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

            TextField(
              maxLines: 3,
              controller: widget.bodyController,
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

              SizedBox(height: 8,),

              ListTile(
                title: Text("Time"),
              )
            ],
          ],
        ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ActionChip(
          label:Text("Save"),
          onPressed: widget.onSave, 
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