import 'package:hive/hive.dart';

class Database {
  final _notesBox=Hive.box("NotesBox");
  List notesList=[];

  void initializer (){
    notesList=[
      "hi",
      "hello",
    ];
  }

  void loadData(){
    notesList=_notesBox.get("NotesList");
  }

  void updateData(){
    _notesBox.put("NotesList", notesList);
  }
}