import 'package:bee_list/components/list_item_tile.dart';
import 'package:bee_list/data.dart';
import 'package:bee_list/pages/item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final data = Data;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text("Bee's List"),
      ),
      
      body: Container(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: data.keys.length,
          itemBuilder: (context, int i){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder:(context)=>ItemPage(index: i,)));
              },
              child: ListItemTile(
                title: data.keys.toList()[i], 
                date: DateTime.now()
              )
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: (){print("creating item tile");},
        child: Icon(
          Icons.add, 
          color:Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}