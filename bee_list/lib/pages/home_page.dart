import 'package:bee_list/services/db.dart';
import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/components/edit_item.dart';
import 'package:bee_list/components/list_item_tile.dart';
import 'package:bee_list/services/models.dart';
import 'package:bee_list/pages/item_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  final Db db;
  const HomePage({
    super.key,
    required this.db
  });
  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  late List<ListItem> listItems;
  @override void initState() {
    super.initState();
    listItems = widget.db.getListItems();
  }

  void onDelete(int id){
    showDialog(
      context: context, 
      builder: (context)=>DeleteAlert(
        message: "Are your sure?", 
        onDelete: (){
          setState(() {
            widget.db.delListItem(id);
            listItems = widget.db.getListItems();
          });
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("Bee's List"),
      ),
      
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (context, int i){
            ListItem lit = listItems[i];
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder:(context)=>ItemPage(index: i, onDelete: onDelete, db:widget.db)));
              },
              child: ListItemTile(
                title:lit.title, 
                date: lit.time
              )
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: (){
          TextEditingController controller=TextEditingController();
          showDialog(context: context, 
            builder: (context)=>EditItem(
              title: "Title",
              controller: controller, 
              onSave: (){
                final title =  controller.text.trim().split("")[0].toUpperCase()+controller.text.trim().substring(1);
                ListItem litem = ListItem(title: title, time: DateTime.now());
                setState((){
                  widget.db.addListItem(litem);
                  listItems = widget.db.getListItems();
                });
                Navigator.pop(context);
              }
            )
          );
        },
        child: Icon(
          Icons.add, 
          color:Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}