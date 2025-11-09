import 'package:bee_list/components/db.dart';
import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/components/edit_item.dart';
import 'package:bee_list/components/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemTile extends StatefulWidget{
  int listId;
  int itemId;
  Db db;
  ItemTile({
    super.key,
    required this.listId,
    required this.itemId,
    required this.db,
  });

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  late Item item;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    item=widget.db.getItems(widget.listId)[widget.itemId];
  }

  void onEdit(){
    TextEditingController controller = TextEditingController();
    controller.text = item.text;
    showDialog(context: context, 
      builder:(context) => EditItem(
        title: "Edit Item", 
        controller: controller, 
        onSave: (){
          item.text = controller.text;
          widget.db.saveItem(widget.listId, widget.itemId, item);
          setState(() {
            item = widget.db.getItems(widget.listId)[widget.itemId];
          });
          Navigator.pop(context);
        }
      ),
    );
  }

  void onDel(){
    showDialog(
      context: context, 
      builder: (context)=>DeleteAlert(
        message: "Are you sure?", 
        onDelete: (){
          widget.db.delItem(widget.listId, widget.itemId);
          Navigator.pop(context);
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: DrawerMotion(), 
        children: [
          SlidableAction(
            onPressed: (context)=>onEdit(),
            backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            borderRadius: BorderRadius.circular(16),
          ),
          
          SlidableAction(
            onPressed: (context)=>onDel(),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(16),
          ),
        ]
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0,0,0,4),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // checkBox
            Checkbox(
              checkColor: Theme.of(context).colorScheme.onSurface,
              value: item.check, 
              onChanged:(v){
                setState(() {
                  widget.db.toggleCheck(widget.listId, widget.itemId);
                  item = widget.db.getItems(widget.listId)[widget.itemId];
                });
              }
            ),
            // Bar
            Text("|",
              style: TextStyle(
                fontSize: 20
              ),
            ),

            SizedBox(width: 8,),
            // Text 
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