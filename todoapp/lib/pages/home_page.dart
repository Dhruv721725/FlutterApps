import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialogbox.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller=new TextEditingController();
  TextEditingController editController=new TextEditingController();
  
  TodoDataBase db=new TodoDataBase();

  final _myBox= Hive.box("Todobox");
  @override
  void initState (){
    if (_myBox.get("TodoList")==null){
      db.createinitialData();
    }else{
      db.loadData();
    }
  }

  void CheckChange(int index){
    setState(() {
      db.todos[index][1]=db.todos[index][1]==false?true:false;
    });
    db.updateData();
  }

  void onSave(){
    String text= controller.text.trim();
    setState(() {
      if(text!=""){
        db.todos.add([text,false]);
      }
    });
    controller.value=TextEditingValue.empty;
    Navigator.of(context).pop();
    db.updateData();
  }

  void onDelete(int index){
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
  }

  void onEdit(int index){
    editController.value=TextEditingValue(text: db.todos[index][0]);
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.purple,
          content: Container(
            height: 120,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    
                  ),
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    fillColor: Colors.purpleAccent,
                    hintText: "Enter todo...",
                    hintStyle: TextStyle(color: Colors.white60)
                  ),
                  controller: editController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        var txt=editController.text.trim();
                        if(txt!=""){
                          setState(() {
                            db.todos[index][0]=txt;
                          });
                        }
                        Navigator.of(context).pop();
                        editController.value=TextEditingValue.empty;
                        db.updateData();
                      },
                      child: Text("Save", style: TextStyle(color: Colors.white70)),
                      color: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    MaterialButton(
                      onPressed:(){
                        Navigator.of(context).pop();
                        editController.value=TextEditingValue.empty;
                      },
                      child: Text("Cancel", style: TextStyle(color: Colors.white70)),
                      color: Colors.purpleAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                )
              ]
            ),
          )
        );
      }
      );
  }

  void onCancel(){
    controller.value=TextEditingValue.empty;
    Navigator.of(context).pop();
  }
  
  void addTodo(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(controller:controller, onSave: onSave, onCancel: onCancel,);
      },
      );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors:[Colors.purpleAccent, Colors.pink],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        ),
      ),
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "To Dos 🌌",
          style: TextStyle(
            fontWeight:FontWeight.w900,
            color: Colors.white70,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        itemCount: db.todos.length,
        itemBuilder:(context, index){
          return TodoTile(
            todo: db.todos[index][0],
            todoDone: db.todos[index][1],
            onchanged: (p0) {
              CheckChange(index);
            },
            onDelete: (context){onDelete(index);} ,
            onEdit: (context){onEdit(index);},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(172, 155, 39, 176),
      ),
    ));
  }
}
