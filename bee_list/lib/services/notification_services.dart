import 'package:bee_list/services/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzd;

class NotificationServices {
  static final FlutterLocalNotificationsPlugin _flnp = FlutterLocalNotificationsPlugin();
  Future<void> init() async {
  const androidInit = AndroidInitializationSettings("@mipmap/ic_launcher");
  const initSettings = InitializationSettings(android: androidInit);

  await _flnp.initialize(initSettings);

  tzd.initializeTimeZones();

  // 🔥 REQUIRED for full-screen notifications
  await _flnp
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        const AndroidNotificationChannel(
          'daily_channel',          // Must match your NotificationDetails
          'Daily Reminders',
          importance: Importance.max,
          playSound: true,
        ),
      );

  // OPTIONAL but recommended: also create channels for weekly + fixed
  await _flnp
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        const AndroidNotificationChannel(
          'weekly_channel',
          'Weekly Reminders',
          importance: Importance.high,
          playSound: true,
        ),
      );

  await _flnp
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(
        const AndroidNotificationChannel(
          'fixed_channel',
          'Fixed Reminders',
          importance: Importance.high,
          playSound: true,
        ),
      );
}

  static AndroidNotificationDetails _details(){
    return const AndroidNotificationDetails(
        'daily_channel',
        'Daily Reminders',
        importance: Importance.max,
        priority: Priority.high,
        channelDescription: 'High priority sound + popup',
        playSound: true,
        fullScreenIntent: true,
        visibility: NotificationVisibility.public,
        category: AndroidNotificationCategory.alarm,
    );
  }

  static AndroidNotificationDetails _weeklyReminderDetails(){
    return const AndroidNotificationDetails(
        'weekly_channel', 
        'Weekly Reminders',
        importance: Importance.high,
        priority: Priority.high,
        channelDescription: 'High priority sound + popup',
        playSound: true,
        fullScreenIntent: true,
        visibility: NotificationVisibility.public,
        category: AndroidNotificationCategory.alarm,
    );
  }

  static AndroidNotificationDetails _fixedReminderDetails(){
    return const AndroidNotificationDetails(
        'fixed_channel', 
        'Fixed Reminders',
        importance: Importance.high,
        priority: Priority.high,
        channelDescription: 'High priority sound + popup',
        playSound: true,
        fullScreenIntent: true,
        visibility: NotificationVisibility.public,
        category: AndroidNotificationCategory.alarm,
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
      NotificationDetails(android: _details()), 
      
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
      NotificationDetails(android:_weeklyReminderDetails()), 
      
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
      NotificationDetails(android:_fixedReminderDetails()), 
      
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime, //fixed date and time
      payload: '${reminder.id}'
    );
  }
}