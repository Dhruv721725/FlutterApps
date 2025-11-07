import 'package:bee_list/components/db.dart';
import 'package:bee_list/components/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemTile extends StatefulWidget{
  int listId;
  int itemId;
  ItemTile({
    super.key,
    required this.listId,
    required this.itemId,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  
  @override
  Widget build(BuildContext context) {
    Item item = Db.getItems(widget.listId)[widget.itemId];

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(0,0,0,4),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [

            Checkbox(
              checkColor: Theme.of(context).colorScheme.onSurface,
              value: item.check, 
              onChanged:(v){
                setState(() {
                  Db.toggleCheck(widget.listId, widget.itemId);
                  item = Db.getItems(widget.listId)[widget.itemId];
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
              item.text,
              style: TextStyle(
                decoration: item.check? TextDecoration.lineThrough : null,
              ),
            ),

          ],
        ),
      ),
    );
  }
}