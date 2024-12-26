import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget{
  final String todo;
  final bool todoDone;
  Function(bool?)? onchanged;

  TodoTile({required this.todo,required this.todoDone,required this.onchanged,super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.elliptical(12, 12))

      ),
      child: Row(
        spacing: 10,
        children: [
          Checkbox(value: todoDone, onChanged: onchanged),
          Text("|", style: TextStyle(fontSize:20),),
          Text(
            todo,
            style: TextStyle(),
          ),
        ],
      )      
    );
  }
}