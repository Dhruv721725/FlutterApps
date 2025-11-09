import 'package:bee_list/components/models.dart';
import 'package:flutter/material.dart';

class ListItemTile extends StatelessWidget{
  final String title;
  final DateTime date;
  const ListItemTile({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.fromLTRB(0,0,0,5),
      padding: EdgeInsets.all(4),
      
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(
        title: Text(title),
        trailing: Text("${date.day} ${months()[date.month-1]}, ${date.year}"),
      ),
    );
  }
}