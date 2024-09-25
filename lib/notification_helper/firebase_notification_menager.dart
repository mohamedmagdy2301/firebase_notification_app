import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notification_app2/notification_helper/local_notification_service.dart';

class FirebaseNotificationMenager {
  static Future initFirebaseNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    messaging.getToken().then((value) {
      sendTokenToService(value!);
    });
    messaging.onTokenRefresh.listen((value) {
      sendTokenToService(value);
    });
    //! If We want to Sent notification for all users ,We can use topic
    // messaging.subscribeToTopic("all");
    //! If We want to remove users from topic
    // messaging.unsubscribeFromTopic("all");

    notifiationManager();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }
}

//! To send token to service backend
sendTokenToService(String token) {
  log("Token: $token");
  // Option 1 => API

  // Option 2 => Flutter Firebase

  // Option 3 => Flutter Local Notification
}

//! To show local notification in foreground
notifiationManager() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    LocalNotificationService.showBasicNotification(message);
    log('Got a message whilst in the foreground!');
    log('**************Message also contained a notification: ${message.notification?.title}*************');
  });
}

// ! To show notification in background
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Handling a background message: ${message.messageId}-------------------------------");
}
