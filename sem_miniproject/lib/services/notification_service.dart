import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationPlugin = FlutterLocalNotificationsPlugin();
  static int notificationCount = 0;

  initializeNotifications(){
    const AndroidInitializationSettings androidSettings =  
      AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = 
      InitializationSettings(android: androidSettings);

    notificationPlugin.initialize(initSettings);
  }

  Future<void> showNotification(String title, String body)async{
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      "channel_id", 
      "Local Notifications",
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);
    
    await notificationPlugin.show(
      notificationCount++,
      title, 
      body, 
      notificationDetails
    );
  }
}