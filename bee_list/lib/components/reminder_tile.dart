import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ReminderTile extends StatefulWidget {
  final Reminder reminder;
  void Function() onEdit;
  void Function() onDel;
  ReminderTile({
    super.key,
    required this.reminder,
    required this.onEdit,
    required this.onDel,  
  });

  @override
  State<ReminderTile> createState() => _ReminderTileState();
}

class _ReminderTileState extends State<ReminderTile> { 

  @override
  Widget build(BuildContext context) {
    int? day = widget.reminder.day;
    DateTime? date = widget.reminder.date;

    String dayt = day!=null ? weekDays()[day] : "${date!.day} ${months()[date.month]}, ${date.year}";

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(), 
          children: [
            SlidableAction(
              onPressed:(context)=>widget.onEdit,
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: "Edit",
              borderRadius: BorderRadius.circular(20),
            ),
            SlidableAction(
              onPressed: (context)=>widget.onDel,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "Delete",
              padding: EdgeInsets.all(8),
              borderRadius: BorderRadius.circular(20),
            )
          ]
        ),
        child:Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
            border: BoxBorder.all(
              color: Theme.of(context).colorScheme.primary
            )
          ), 
          child: ListTile(
            title: Text(widget.reminder.title),
            subtitle: Column(            
              children: [
                Text(widget.reminder.body),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text(dayt),
                    Text("${widget.reminder.hr}:${widget.reminder.min}")
                  ]
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
