import 'package:isar/isar.dart';

// run cmd dart run build_runner build (to generate file).
part 'habit.g.dart';

@Collection()
class Habit{
  //  id
  Id id= Isar.autoIncrement;

  //  habit name
  late String name;

  // completed days
  List<DateTime> completedDays=[
    // DateTime(year, month, day),
    // DateTime(year, month, day),
  ];

}