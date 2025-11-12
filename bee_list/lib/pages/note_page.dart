import 'package:bee_list/services/db.dart';
import 'package:bee_list/components/delete_alert.dart';
import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  final int listId;
  final int noteId;
  final Db db;
  const NotePage({
    super.key,
    required this.listId,
    required this.noteId,
    required this.db,
  });
  
  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late Note note;
  late List<Note> notes;
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    notes = widget.db.getNotes(widget.listId);
    if (notes.length>widget.noteId) {
      note = notes[widget.noteId];
      _controller.text = note.text;
    }else{
      note = Note(text: "", time: DateTime.now());
      widget.db.addNote(widget.listId, note);
    }
  }
  
  void saveNote(int noteId, note){
    widget.db.saveNote(widget.listId, noteId, note);
  }

  void onDelete(){
    Navigator.pop(context);
    showDialog(
      context: context, 
      builder: (context)=>DeleteAlert(
        message: "Are your sure?", 
        onDelete: (){
          widget.db.delNote(widget.listId, widget.noteId);
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    note.text = _controller.text;
    Future.microtask((){
      saveNote(widget.noteId, note);
    });
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.db.getListItems()[widget.listId]} Note"),
    
        actions: [
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outlined)
          )
        ],
      ),
    
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12)
          ),
          child: TextFormField(
            controller: _controller,
            autofocus: true,
            maxLines: null,
            minLines: 1,
            keyboardType: TextInputType.multiline,
          
            textInputAction: TextInputAction.newline,
          
            decoration: InputDecoration(
              hintText: "Write your notes here...",
              border: InputBorder.none
            ),  
          ),
        ),
      ), 
    );
  }
}