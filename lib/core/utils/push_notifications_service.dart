import 'package:awfar_captain/core/networking/local/prefs_manager.dart';
import 'package:awfar_captain/core/networking/local/shared_preferences.dart';
import 'package:awfar_captain/core/utils/local_notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;




  static Future init() async {
    // get permissions
   await firebaseMessaging.requestPermission();

    // get token for each device
   String ? fcmToken = await firebaseMessaging.getToken();


    if (fcmToken!= null) {
      print('FCM Token: $fcmToken');
      SharedPreferencesManager.saveData(key: PrefsManager.fcmToken, value: fcmToken);
    } else {
      print('Failed to get FCM token');
    }
    // send message if app killed and background
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    // send message foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      // show local message 
      LocalNotificationsService.showNotification(title: remoteMessage.notification!.title, body: remoteMessage.notification!.body);
    });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message)async {
    await Firebase.initializeApp();
    print('Background Message: ${message.notification?.body?? 'No message'}');
  }
}