import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget{
  final String todo;
  final bool todoDone;
  Function(bool?)? onchanged;
  Function (BuildContext)? onDelete;
  Function (BuildContext)? onEdit;
  TodoTile({required this.todo,required this.todoDone,required this.onchanged,required this.onDelete, required this.onEdit,super.key});
  
  TextDecoration islined(){
    if (!todoDone) {
      return TextDecoration.none;
    }
    return TextDecoration.lineThrough;
  } 
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane:ActionPane(
        motion: StretchMotion(), 
        children:[
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
          ),
          SlidableAction(
            onPressed:onEdit,
            icon: Icons.edit,
            backgroundColor: Colors.greenAccent,
          ),
        ]
      ) ,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.elliptical(12, 12))

        ),
        child: Row(
          spacing: 10,
          children: [
            Checkbox(
              activeColor: Colors.black,
              checkColor: Colors.purple,
              value: todoDone, 
              onChanged: onchanged
              ),
            Text("|", style: TextStyle(fontSize:20),),
            Expanded(child:Text(
              todo,
              style: TextStyle(
                decoration: islined(),
                color: Colors.white70,
                decorationColor: Colors.white70
              ),
            )),
          ],
        )      
      )
    );
  }
}