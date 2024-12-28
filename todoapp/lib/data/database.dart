import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  // List todos=[];
  final _myBox=Hive.box("Todobox");
  
  List todos=[
  ];
  int? day;

  List uncheck(){
    List temp= _myBox.get("TodoList");
    for (var element in temp) {
      element[1]=false;
    }
    return temp;
  }

  void createinitialData(){
    todos=[
      ["click on '✅' check box to mark them done.",false],
      ["click on floating '+' button to add todos.",false],
      ["slide the todo left to and click on delete to delete it from your todo list.",false],
      ["slide the todo left to and click on edit to edit it from your todo list.",false],
    ];
    day=DateTime.now().day;
  }

  void loadData(){
    if (_myBox.get("Day")!=DateTime.now().day) {
        _myBox.put("Day",DateTime.now().day);
        _myBox.put("TodoList",uncheck());
    }
    todos=_myBox.get("TodoList");
    day=_myBox.get("day");
  }

  void updateData(){
    _myBox.put("TodoList",todos);
    _myBox.put("Day",day);
  }
}