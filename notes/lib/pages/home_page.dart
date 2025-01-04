import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/database/database.dart';
import 'package:notes/pages/dialog_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _notesBox=Hive.box("NotesBox");
  final db=new Database();

  @override
  void initState() {
    if (_notesBox.get("NotesList")==null) {
      db.initializer();
    }else{
      db.loadData();
    }
  }

  // on add
  void onAdd(){
    final controller= new TextEditingController();
    showDialog(
      context: context, 
      builder: (context){
        return DialogPage(
          controller: controller,
          onSave: (){
            setState(() {
              String note=controller.text.trim();
              if(note!=""){
                db.notesList.add(note);
                db.updateData();
              }
            });
          },
        );
      }
    );
  }

  // on edit
  void onEdit(int id){
    final controller= new TextEditingController();
    controller.value=new TextEditingValue(text: db.notesList[id]);
    showDialog(
      context: context, 
      builder: (context){
        return DialogPage(
          controller: controller,
          onSave: (){
            setState(() {
              String note=controller.text.trim();
              if(note!=""){
                db.notesList[id]=note;
                db.updateData();
              }
            });
          },
        );
      }
    );
  }

  // on del
  void onDel(String note){
    setState(() {
      db.notesList.remove(note);
      db.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child:ListView.builder(
          itemCount: db.notesList.length,
          itemBuilder: (context, index){
            return Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(10),
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Text(db.notesList[index])),
                  Row(
                    children: [                      
                      GestureDetector(
                        onTap: ()=>onEdit(index),
                        child: Container(
                          child: Icon(Icons.edit),
                        ),
                      ),                  
                      GestureDetector(
                        onTap: ()=>onDel(db.notesList[index]),
                        child: Container(
                          child: Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:onAdd,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}