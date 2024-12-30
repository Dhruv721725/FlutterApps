import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  final _myBox=Hive.box("Todobox");
  List todos=[];

  void createinitialData(){
    todos=[
      ["click on '✅' check box to mark them done.",false],
      ["click on floating '+' button to add todos.",false],
      ["slide the todo left to and click on delete to delete it from your todo list.",false],
      ["slide the todo left to and click on edit to edit it from your todo list.",false],
    ];
  }

  void loadData(){
    todos=_myBox.get("TodoList");
  }

  void updateData(){
    _myBox.put("TodoList",todos);
  }
}