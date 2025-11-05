import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/components/edit_item.dart';
import 'package:bee_list/components/item_tile.dart';
import 'package:bee_list/components/note_tile.dart';
import 'package:bee_list/data.dart';
import 'package:bee_list/pages/note_page.dart';
import 'package:bee_list/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemPage extends StatefulWidget {
  int index;
  ItemPage({
    super.key,
    required this.index 
  });
  @override
  State<ItemPage> createState() => _ItemPageState();  
}

class _ItemPageState extends State<ItemPage> {
  late String key;
  @override 
  void initState() {
    key=Data.keys.toList()[widget.index];
    super.initState();

  }

  void onCreateNote(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotePage(keyText: key, id: 0)));
  }

  void onCreateItem(){
    TextEditingController controller = new TextEditingController();
    showDialog(context: context, 
      builder: (context)=>EditItem(title: "Item", controller: controller, 
        onSave: (){

        }
      )
    );
  }

  void onDelete(){
    showDialog(
      context: context, 
      builder: (context)=>DeleteAlert(
        message: "Are your sure?", 
        onDelete: (){
          setState(() {
            print("Deleting item");
          });
        },
      ),
    );
  }

  void onEdit(int? id){
    TextEditingController controller = new TextEditingController();
    controller.text = id!=null?  Data[key]!["Items"]![id]["text"] : "";
    showDialog(
      context: context, 
      builder: (context)=>EditItem(
        onSave: (){
          setState(() {
            print("Saving Item");
          });
        },
        title: "Edit Item",
        controller: controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(key),

        actions: [
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete)
          )
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        
        child: Column(
          children: [
            Data[key]!["Notifications"]!=null?
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>NotificationPage(text: key))),
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text("Notifications")),
              ),
            )
            :SizedBox(),
            // Notes 
            Data[key]!["Notes"]!=null 
            ? SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Data[key]!["Notes"]!.length,
                
                itemBuilder:(context, id){
                  Map<String,dynamic> note = Data[key]!["Notes"]![id];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context)=>NotePage(keyText: key,id: id,))
                    ),
                    child: NoteTile(
                      text : note["text"],
                      time: note["time"],
                    ),
                  );  
                }
                 
              ),
            ) 
            : SizedBox(),

            // Items List
            Data[key]!["Items"]!=null 
            ? Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Data[key]!["Items"]!.length,
                
                itemBuilder:(context, id){
                  Map<String,dynamic> item = Data[key]!["Items"]![id];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: DrawerMotion(), 
                      children: [

                        SlidableAction(
                          onPressed: (context)=>onEdit(id),
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor: Colors.white,
                          icon: Icons.edit,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        
                        SlidableAction(
                          onPressed: (context){},
                          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          borderRadius: BorderRadius.circular(16),
                        ),

                      ]
                    ),

                    child: ItemTile(
                      text : item["text"],
                      check: item["check"],
                    ),
                  );  
                }

              ),
            ) 
            : Center(child: Text("No items to list.")),
          ],
        ),
      ),
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