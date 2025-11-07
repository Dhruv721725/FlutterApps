import 'package:bee_list/components/db.dart';
import 'package:bee_list/components/edit_item.dart';
import 'package:bee_list/components/list_item_tile.dart';
import 'package:bee_list/components/models.dart';
import 'package:bee_list/pages/item_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
} 

class _HomePageState extends State<HomePage> {
  List<ListItem> listItems = Db.getListItems();

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
                  MaterialPageRoute(builder:(context)=>ItemPage(index: i,)));
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
          TextEditingController controller=new TextEditingController();
          showDialog(context: context, 
            builder: (context)=>EditItem(
              title: "Title",
              controller: controller, 
              onSave: (){
                final title =  controller.text.trim().split("")[0].toUpperCase()+controller.text.trim().substring(1);
                ListItem litem = new ListItem(title: title, time: DateTime.now());
                setState((){
                  Db.addListItem(litem);
                  listItems = Db.getListItems();
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