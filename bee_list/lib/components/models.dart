import 'package:hive_flutter/adapters.dart';
part 'models.g.dart';

List months()=>["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
List weekDays()=>["Sunday", "Monday", "Tuesday", "Wedneday", "Thursday", "Friday", "Saturday", "Everyday"];

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
  List<AppNotification> notifications;

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
class AppNotification{
  @HiveField(0)
  String text;
  
  @HiveField(1)
  int day;
  
  @HiveField(2)
  int hr;
  
  @HiveField(3)
  int min;
  
  @HiveField(4)
  final DateTime time;

  AppNotification({
    required this.text,
    required this.day,
    required this.hr,
    required this.min,
    required this.time,
  });
}