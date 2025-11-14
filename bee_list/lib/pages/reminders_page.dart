import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/components/edit_reminder.dart';
import 'package:bee_list/components/reminder_tile.dart';
import 'package:bee_list/services/db.dart';
import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemindersPage extends StatefulWidget{
  final int listId;
  final Db db;
  RemindersPage({
    super.key,
    required this.listId,
    required this.db,
  });
  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  late List<Reminder> rmndrs = widget.db.getReminders(widget.listId);
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  void addReminder(){
    showDialog(
      context: context, 
      builder: (context)=>EditReminder(
        title: "Add Reminder", 
        rmndrTm: TimeOfDay.now(), 
        isOn: true, 
        onSave: (Reminder reminder){
          widget.db.addReminder(widget.listId, reminder);
          Navigator.pop(context);
        }
      ),
    );
  }
  
  void onEdit(int listId, int rmdrId){
    Reminder rmndr = rmndrs[rmdrId];
    _title.text=rmndr.title;
    _body.text=rmndr.body;
    showDialog(
      context: context, 
      builder: (context)=>EditReminder(
        title: "Edit Reminder", 
        rmndrTm: TimeOfDay(hour: rmndr.hr, minute: rmndr.min) , 
        reminderTitle: rmndr.title,
        reminderBody: rmndr.body,
        day: rmndr.day,
        date: rmndr.date,
        isOn: true, 
        onSave: (Reminder reminder){
          widget.db.saveReminder(listId,rmdrId ,reminder);
          Navigator.pop(context);
        }
      ),
    );
  }

  void onDel(int listId, int rmdrId){
    showDialog(
      context:context,
      builder: (context)=>DeleteAlert(
        message: "Are you sure?", 
        onDelete: (){
          widget.db.delReminder(listId, rmdrId);
          Navigator.pop(context);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    
    final db = context.watch<Db>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Reminders"),
      ),

      body: rmndrs.isNotEmpty
      ? Container(
        padding:EdgeInsets.all(12) ,
        child: ListView.builder(
          itemCount: rmndrs.length,
          itemBuilder: (context, id){
            return ReminderTile(
              reminder: rmndrs[id],
              onEdit: (){onEdit(widget.listId, id);},
              onDel: (){onDel(widget.listId, id);},
            );
          } 
        ),
      )
      : Center(child: Text("No reminders yet"),),
      floatingActionButton: FloatingActionButton(
        onPressed: addReminder,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.tertiary,),
      ),
    );
  }
}