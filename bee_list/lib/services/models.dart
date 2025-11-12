import 'package:hive_flutter/adapters.dart';
part 'models.g.dart';

List months()=>["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
List weekDays()=>["Everyday","Sunday", "Monday", "Tuesday", "Wedneday", "Thursday", "Friday", "Saturday"];

@HiveType(typeId: 0)
class ListItem{
  @HiveField(0)
  String title;
  
  @HiveField(1)
  DateTime time;

  @HiveField(2)
  List<Item> items;
  
  @HiveField(3)
  List<Note> notes;
  
  @HiveField(4)
  List<Reminder> notifications;

  ListItem({
    required this.title,
    required this.time,
  }): items = [],
      notes = [],
      notifications = [];
}


@HiveType(typeId: 1)
class Item{
  @HiveField(0)
  String text;
  
  @HiveField(1)
  bool check;
  
  @HiveField(2)
  final DateTime time;
  Item({
    required this.text,
    required this.check,
    required this.time,
  });
}


@HiveType(typeId: 2)
class Note{
  @HiveField(0)
  String text;
  
  @HiveField(1)
  final DateTime time;
  Note({
    required this.text,
    required this.time,
  });
}


@HiveType(typeId: 3)
class Reminder{
  @HiveField(0)
  String title;

  @HiveField(1)
  String body;
  
  @HiveField(3)
  int hr;
  
  @HiveField(4)
  int min;

  @HiveField(5)
  int? day;
  
  @HiveField(6)
  DateTime? date;
  
  @HiveField(7)
  final DateTime time;

  Reminder({
    required this.title,
    required this.body,
    required this.hr,
    required this.min,
    this.day,
    this.date,
    required this.time,
  });
}