import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzd;

class NotificationServices {
  static final FlutterLocalNotificationsPlugin _flnp = FlutterLocalNotificationsPlugin();
  Future<void> init() async{
    const AndroidInitializationSettings androidInit = AndroidInitializationSettings("@mipmap/ic_launcher");
    const InitializationSettings initSettings = InitializationSettings(android: androidInit);
    
    await _flnp.initialize(initSettings);
    tzd.initializeTimeZones();
  }

  static NotificationDetails _details(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel',
        'Daily Reminders',
        importance: Importance.max,
        priority: Priority.high,
      )
    );
  }

  static NotificationDetails _weeklyReminderDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'weekly_channel', 
        'Weekly Reminders',
        importance: Importance.high,
        priority: Priority.high,
      )
    );
  }

  static NotificationDetails _fixedReminderDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'fixed_channel', 
        'Fixed Reminders',
        importance: Importance.high,
        priority: Priority.high,
      )
    );
  }

  Future<void> scheduleDailyReminder(Reminder reminder)async{
    final time = TimeOfDay(hour: reminder.hr, minute: reminder.min);

    final now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    // if time is passed today
    if(scheduled.isBefore(now)){
      scheduled = scheduled.add(const Duration(days: 1));
    }

    await _flnp.zonedSchedule(
      reminder.id, 
      reminder.title, 
      reminder.body, 
      tz.TZDateTime.from(scheduled, tz.local), 
      _details(), 
      
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time, //daily repeat
      payload: '${reminder.id}'
    );
  }

  Future<void> cancelReminder(int id)async{
    await _flnp.cancel(id);
  }

  Future<void> scheduleWeeklyReminder(Reminder reminder)async{
    final time = TimeOfDay(hour: reminder.hr, minute: reminder.min);

    final now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, time.hour, time.minute);

    // if time or day is passed today
    while(scheduled.weekday != reminder.day || scheduled.isBefore(now)){
      scheduled = scheduled.add(const Duration(days: 1));
    }

    await _flnp.zonedSchedule(
      reminder.id, 
      reminder.title, 
      reminder.body, 
      tz.TZDateTime.from(scheduled, tz.local), 
      _weeklyReminderDetails(), 
      
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime, //weekly repeat
      payload: '${reminder.id}'
    );
  }

  Future<void> scheduleFixedReminder(Reminder reminder)async{
    final time = TimeOfDay(hour: reminder.hr, minute: reminder.min);

    var scheduled = DateTime(reminder.date!.year, reminder.date!.month, reminder.date!.day, time.hour, time.minute);    

    await _flnp.zonedSchedule(
      reminder.id, 
      reminder.title, 
      reminder.body, 
      tz.TZDateTime.from(scheduled, tz.local), 
      _fixedReminderDetails(), 
      
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime, //fixed date and time
      payload: '${reminder.id}'
    );
  }
}