import 'package:flutter/material.dart';
import 'package:habit_tracker/models/app_settings.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  // initialize db
  static Future<void> initialize()async{
    final dir=await getApplicationDocumentsDirectory();
    isar=await Isar.open(
      [HabitSchema,AppSettingsSchema], 
      directory: dir.path);
  }
  // save on first startup
  Future<void> saveFirstLauncDate()async{
    final exist_setting = isar.appSettings.where().findFirst();
    if (exist_setting==null) {
      final settings= AppSettings()..firstTimeLaunchDate=DateTime.now();
      await isar.writeTxn(()=>isar.appSettings.put(settings));
    }
  }

  // get first date 
  Future<DateTime?> getFirstLaunchDate()async{
    final settings=await isar.appSettings.where().findFirst();
    return settings?.firstTimeLaunchDate;
  }

  /* 
  crud
  */
  // list of habits
  List<Habit> currentHabits=[];

  // create - add a new habbit
  
  Future<void> addHabit(String habitName)async{

    final newHabit= Habit()..name=habitName;
    isar.writeTxn(()=>isar.habits.put(newHabit));

    readHabits();
  }

  // read - read saved habits from db 

  Future<void> readHabits()async{
    List<Habit> fetchedHabits= await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners();
  }

  // update check habbit on and off
  Future <void> checkHabit(int id, bool isCompleted)async{
    final habit=await isar.habits.get(id);
    if (habit!=null) {
      await isar.writeTxn(()async{
        if(isCompleted && !habit.completedDays.contains(DateTime.now())){
          final today=DateTime.now();
          habit.completedDays.add(
            DateTime(
              today.year,
              today.month,
              today.day
            )
          );

        }else{
          habit.completedDays.removeWhere(
            (date)=>
            date.year==DateTime.now().year && 
            date.month==DateTime.now().month && 
            date.day==DateTime.now().day
          );
        }
        await isar.habits.put(habit);
      });
    }
  }
  
  // update - edit habbit name
  Future<void> editHabitName(int id, String newname)async{
    final habit=await isar.habits.get(id);
    if (habit!=null) {
      await isar.writeTxn(()async{
          habit.name=newname;
          await isar.habits.put(habit);
        });
    }
    readHabits();
  }


  // delete - delete habit
  Future<void> deleteHabit(int id)async{
    await isar.writeTxn(()async{
      isar.habits.delete(id);
    });
    readHabits();
  }
}