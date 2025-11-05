List months()=>["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];

List weekDays()=>["Sunday", "Monday", "Tuesday", "Wedneday", "Thursday", "Friday", "Saturday", "Everyday"];

class Item{
  final String text;
  final bool check;
  final DateTime time;
  const Item({
    required this.text,
    required this.check,
    required this.time,
  });
}

class Note{
  final String text;
  final DateTime time;
  const Note({
    required this.text,
    required this.time,
  });
}

class Notification{
  final String text;
  final int day;
  final int hr;
  final int min;
  final DateTime time;

  Notification({
    required this.text,
    required this.day,
    required this.hr,
    required this.min,
    required this.time,
  });
}
class ListItem{
  String title;
  DateTime time;
  List<Item> items=[];
  List<Note> notes=[];
  List<Notification> notifications=[];

  ListItem({
    required this.title,
    required this.time,
  });
}