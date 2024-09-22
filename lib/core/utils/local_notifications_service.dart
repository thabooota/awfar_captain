import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: (response) {});
  }

  static void showNotification({
    required String? title,
    required String? body,
  }) async {
    NotificationDetails details = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            icon: '@mipmap/ic_launcher',
            importance: Importance.max,
            priority: Priority.high));
    await flutterLocalNotificationsPlugin.show(0, title, body, details);
  }
}
