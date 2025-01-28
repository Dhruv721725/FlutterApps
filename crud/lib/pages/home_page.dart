import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  
  TextEditingController controller=new TextEditingController();
  
  // firestore
  final FirestoreService firestoreService=new FirestoreService();
  
  // open a dialogbox uto add a note
  void openNoteBox(String? docId){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        content: TextField(controller: controller,),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: (){
                  if (docId==null) {
                    firestoreService.addNote(controller.text);
                  }else{
                    firestoreService.updateNote(docId, controller.text);
                  }
                  controller.clear();
                  Navigator.pop(context);
                }, 
                child: Text("Save"),
              ),
              SizedBox(width: 16,),
              ElevatedButton(
                onPressed: (){
                  controller.value=TextEditingValue.empty;
                  Navigator.pop(context);
                }, 
                child: Text("cancel"),
              ),
            ],
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()=>openNoteBox(null),
        child: Icon(Icons.add),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(), 
        builder: (context,snapshot){
          if (snapshot.hasData) {
            List notesList=snapshot.data!.docs;

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, count){
                DocumentSnapshot doc=notesList[count];
                String docId=doc.id;

                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text(doc['note']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: ()=>openNoteBox(docId), 
                          icon: Icon(Icons.settings)
                        ),
                        IconButton(
                          onPressed: ()=>firestoreService.deleteNote(docId), 
                          icon: Icon(Icons.delete)
                        ),
                      ],
                    ),
                  ),
                );

              }
            );
          }else{
            return Text("No data available");
          }
        }
      ),
    );
  }
}
