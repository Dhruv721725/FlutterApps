import 'package:bee_list/components/item_tile.dart';
import 'package:bee_list/components/note_tile.dart';
import 'package:bee_list/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  @override
  Widget build(BuildContext context) {
    final key=Data.keys.toList()[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: Text(key),
      ),

      body: Container(
        padding: EdgeInsets.all(12),
        
        child: Column(
          children: [

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
                  return NoteTile(
                    text : note["text"],
                    time: note["time"],
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
                  return ItemTile(
                    text : item["text"],
                    check: item["check"],
                  );  
                }

              ),
            ) 
            : Center(child: Text("No items to list.")),

          ],
        ),
      ),
    );
  }
} 