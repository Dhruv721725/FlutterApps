import 'package:bee_list/components/edit_reminder.dart';
import 'package:bee_list/components/reminder_tile.dart';
import 'package:bee_list/services/db.dart';
import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class RemindersPage extends StatefulWidget{
  final int listId;
  RemindersPage({
    super.key,
    required this.listId,
  });
  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  
  void addReminder(){
    TextEditingController _title = TextEditingController();
    TextEditingController _body = TextEditingController();
    showDialog(
      context: context, 
      builder: (context)=>EditReminder(
        title: "Add Reminder", 
        titleController: _title, 
        bodyController: _body, 
        hr: 00, 
        min: 00, 
        onSave: ()=>(String title, String body, int hr, int min, int? id, int? day, DateTime? date, DateTime? time){
          Reminder rmndr = Reminder(
            title: title, body: body, hr: hr, min: min, 
            time: DateTime.now(),
            day: day,
            date: date,
          );
          if(id==null){

          }else{

          }
        }
      ),
    );
  }
  
  void onEdit(int listId, int rmdrId){

  }

  void onDel(int listId, int rmdrId){

  }

  @override
  Widget build(BuildContext context) {
    
    final db = context.watch<Db>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),

      body: Container(
        padding:EdgeInsets.all(12) ,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, id){
            return ReminderTile(
              reminder: Reminder(
                title: "Title", 
                body: "Body of the Notification", 
                hr: 1, 
                min: 0, 
                day: 0,
                time: DateTime.now()
              ),
              onEdit: ()=>onEdit(widget.listId, id),
              onDel: ()=>onDel(widget.listId, id),
            );
          } 
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addReminder,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary,),
      ),
    );
  }
}