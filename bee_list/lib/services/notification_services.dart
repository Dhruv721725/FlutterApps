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
        'Notifications',
        importance: Importance.max,
        priority: Priority.high,
      )
    );
  }

  // EveryDay Notification at given hr and min
  static Future<void> scheduleEveryDayNotification(
    String title, String body, int hr, int min
  )async{
    final now = tz.TZDateTime.now(tz.local);
    var schedule = tz.TZDateTime(
      tz.local, now.year, now.month, now.day, hr, min
    );
    final id = DateTime.now().millisecondsSinceEpoch.remainder(100000);
    await _flnp.zonedSchedule(
      id, title, body, schedule, 
      _details(), 
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time  
    ); 
  }

}