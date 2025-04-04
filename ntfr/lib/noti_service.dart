import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotiService{
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialize 
  Future <void> initNotification()async{
    if(_isInitialized) return;
    
    // prepare android init settings
    const initSettingsAndroid = 
      AndroidInitializationSettings('@mipmap/ic_launcher');

    // prepare ios init settings
    const initSettingIos = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // init Settings
    const initSettings = InitializationSettings(
      android: initSettingsAndroid,
      iOS: initSettingIos,
    );

    // finally initialize the plugin
    await notificationPlugin.initialize(initSettings);
  }

  // Notofications detail setup
  NotificationDetails notificationDetails(){
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id', 
        'Daily Notofications',
        channelDescription: "Daily Notification Channel",
        importance: Importance.max,
        priority: Priority.high,  
      ),
      iOS:DarwinNotificationDetails(),
    );
  }

  // show notification
  Future<void> showNotification({
    int id=0,
    String? title,
    String? body,
  })async{
    return notificationPlugin.show(
      id, 
      title, 
      body, 
      NotificationDetails()
    );
  }

  // on noti tap


}