import 'package:bee_list/components/db.dart';
import 'package:bee_list/components/edit_item.dart';
import 'package:bee_list/components/item_tile.dart';
import 'package:bee_list/components/models.dart';
import 'package:bee_list/components/note_tile.dart';
import 'package:bee_list/pages/note_page.dart';
import 'package:bee_list/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatefulWidget {
  final int index;
  final Db db;
  final void Function(int) onDelete;
  const ItemPage({
    super.key,
    required this.index, 
    required this.onDelete,
    required this.db,
  });
  @override
  State<ItemPage> createState() => _ItemPageState();  
}

class _ItemPageState extends State<ItemPage> {
  late String key;
  late List<Item> items;
  late List<Note> notes;
  late List<AppNotification> notifiers;
  @override 
  void initState() {
    key=widget.db.getListItems().toList()[widget.index].title;
    super.initState();
    items = widget.db.getItems(widget.index);
    notes = widget.db.getNotes(widget.index);
  }

  // creating note
  void onCreateNote(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (context)=>NotePage(
        listId: widget.index, 
        noteId: notes.length,
        db: widget.db,
      )
      ));
  }

  // creating item
  void onCreateItem(){
    TextEditingController controller = TextEditingController();
    showDialog(context: context, 
      builder: (context)=>EditItem(title: "Item", controller: controller, 
        onSave: (){
          setState(() {
            Provider.of<Db>(context,listen: false).addItem(widget.index, 
              Item(text: controller.text, 
                check: false,
                time: DateTime.now()
              )
            );
            items = widget.db.getItems(widget.index);
          });
          Navigator.pop(context);
          Navigator.pop(context);
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(key),
        actions: [
          IconButton(
            onPressed: ()=>widget.onDelete(widget.index),
            icon: Icon(Icons.delete)
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        
        child: Column(
          children: [
            // Data[key]!["Notifications"]!=null?
            // GestureDetector(
            //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage(text: key))),
            //   child: Container(
            //     padding: EdgeInsets.all(4),
            //     margin: EdgeInsets.all(4),
            //     decoration: BoxDecoration(
            //       color: Theme.of(context).colorScheme.secondary,
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Center(child: Text("Notifications")),
            //   ),
            // )
            // :SizedBox(),
            // // Notes 

            SizedBox(
              height: notes.isNotEmpty ? 150 : 0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: notes.length,
                itemBuilder:(context, id){
                  Note note = notes[id];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>NotePage(listId: widget.index, noteId: id, db:widget.db))
                    ),
                    child: NoteTile(
                      text : note.text,
                      time: note.time,
                    ),
                  );  
                } 
              ),
            ),

            // Items List
            items!=[] 
            ? Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder:(context, id){
                  return ItemTile(
                    listId: widget.index, 
                    itemId: id,
                    db: widget.db
                  );  
                }
              ),
            ) 
            : Center(child: Text("No items to list.")),
          ],
        ),
      ),

      // floating button to create 
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.inversePrimary,),
        onPressed: (){
          showDialog(
            context: context, 
            builder: (context)=>AlertDialog(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // buttton for creating Item
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
                        foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.tertiary),
                      ),
                      onPressed: onCreateItem, 
                      child: Text("Create Item")
                    ),
                  ),

                  // button for creating a note
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
                        foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.tertiary),
                      ),
                      onPressed: onCreateNote, child: Text("Create Note")),
                  ),
                ],
              ),
            )
          );
        }
      ),
    );
  }
} 