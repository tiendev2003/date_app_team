// ignore_for_file: avoid_print

import 'package:date_app_team/core/config/config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> initPlatformState() async {
  OneSignal.shared.setAppId(Config.oneSignel);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
  OneSignal.shared.setPermissionObserver((OSPermissionStateChanges changes) {
    print("Accepted OSPermissionStateChanges : $changes");
  });
  // print("--------------__uID : ${getData.read("UserLogin")["id"]}");
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void loadFCM() async {
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      importance: Importance.high,
      enableVibration: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
