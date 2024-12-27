import 'package:flutter/material.dart';
import 'package:todoapp/pages/todo_page.dart';
import 'package:todoapp/util/dialogbox.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller=new TextEditingController();
  TextEditingController editController=new TextEditingController();
  List todos=[
    ["gfg",false],
    ["flutter",false],
  ];

  void CheckChange(int index){
    setState(() {
      todos[index][1]=todos[index][1]==false?true:false;
    });
  }

  void onSave(){
    String text= controller.text.trim();
    setState(() {
      if(text!=""){
        todos.add([text,false]);
      }
    });
    controller.value=TextEditingValue.empty;
    Navigator.of(context).pop();
  }

  void onDelete(int index){
    setState(() {
      todos.removeAt(index);
    });
  }

  void onEdit(int index){
    editController.value=TextEditingValue(text: todos[index][0]);
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.orange,
          content: Container(
            height: 120,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.orange,
                    hintText: "Enter todo...",
                  ),
                  controller: editController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        setState(() {
                          todos[index][0]=editController.text;
                        });
                        Navigator.of(context).pop();
                        editController.value=TextEditingValue.empty;
                      },
                      child: Text("Save"),
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    ),
                    MaterialButton(
                      onPressed:(){
                        Navigator.of(context).pop();
                        editController.value=TextEditingValue.empty;
                      },
                      child: Text("Cancel"),
                      color: Colors.orangeAccent,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          "To Do",
          style: TextStyle(
            fontWeight:FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.orangeAccent,
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder:(context, index){
          return TodoTile(
            todo: todos[index][0],
            todoDone: todos[index][1],
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
        backgroundColor: Colors.orange,
      ),
    );
  }
}
// Light Purple: (218, 177, 218)
// Lavender: (230, 230, 250)
// Purple: (157, 0, 255) or (160, 32, 240)
// Royal Purple: (108, 59, 170) or (120, 81, 169)
// Violet: (143, 0, 255) or (127, 0, 255)
// Neon Purple: (138, 0, 196)
// Plum: (142, 69, 133)
// Blue Purple: (138, 43, 226)
// Bright Purple: (191, 64, 191)
