import 'package:bee_list/components/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemTile extends StatefulWidget{
  final String text;
  bool check;
  ItemTile({
    super.key,
    required this.text,
    required this.check,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(0,0,0,5),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [

            Checkbox(
              checkColor: Theme.of(context).colorScheme.onSurface,
              value: widget.check, 
              onChanged:(v){
                setState(() {
                  widget.check=!widget.check;
                });
              }
            ),
            
            Text("|",
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(width: 8,),

            Text(
              widget.text,
              style: TextStyle(
                decoration: widget.check? TextDecoration.lineThrough : null,
              ),
            ),

          ],
        ),
      ),
    );
  }
}