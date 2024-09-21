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
    } else {
      print('Failed to get FCM token');
    }
    // send message in killed and background
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message)async {
    await Firebase.initializeApp();
    print('Background Message: ${message.notification?.body?? 'No message'}');
  }
}