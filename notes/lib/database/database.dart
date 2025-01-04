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

  void loadData()async{
    notesList=await _notesBox.get("NotesList");
  }

  void updateData()async{
    _notesBox.put("NotesList", notesList);
  }
}