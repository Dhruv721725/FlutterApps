import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/database/database.dart';
import 'package:notes/pages/dialog_page.dart';
import 'package:notes/pages/drawer_page.dart';

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
            fontSize: 30
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      drawer: DrawerPage(),

      body: Container(
        padding: EdgeInsets.all(25),
        child:ListView.builder(
          itemCount: db.notesList.length,
          itemBuilder: (context, index){
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                  child: Text(
                  db.notesList[index],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  )),
                  Row(
                    children: [                      
                      GestureDetector(
                        onTap: ()=>onEdit(index),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.edit,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),                  
                      GestureDetector(
                        onTap: ()=>onDel(db.notesList[index]),
                        child: Container(
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
          ),
      ),
    );
  }
}