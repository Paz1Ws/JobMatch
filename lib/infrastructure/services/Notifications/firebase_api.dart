import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('FCM Token: $fCMToken');

    FirebaseMessaging.onMessage.listen((message) {
      print('Got a message whilst in the foreground!');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  
  // static final notifcations = FlutterLocalNotificationsPlugin();
  // static Future<void> notificationsDetails() async {
  //   return notificationsDetails(
  //     android: AndroidNotificationDetails(
  //       'channel id',
  //       'channel name',
  //       'channel description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     ),
  //   );
  // }

  // static Future<void> showNotifications(
  //   String title,
  //   String body,
  //   NotificationDetails notificationDetails,
  // ) async {
  //   await notifcations.show(0, title, body, notificationDetails);
  // }
  // void _configureFirebaseMessaging() {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Mensaje recibido: $message');

  //     // Extraer la información del mensaje
  //     String title = message['title'] ?? '';
  //     String body = message['body'] ?? '';

  //     // Mostrar una notificación al usuario
  //     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //         FlutterLocalNotificationsPlugin();
  //     const AndroidNotificationDetails androidNotificationDetails =
  //         AndroidNotificationDetails(
  //             'channel_id', 'channel_name', 'channel_description',
  //             importance: Importance.HIGH,
  //             priority: Priority.HIGH,
  //             showWhen: ShowWhen.ALWAYS,
  //             ticker: 'ticker');
  //     const NotificationDetails notificationDetails =
  //         NotificationDetails(android: androidNotificationDetails);
  //     flutterLocalNotificationsPlugin.show(1, title, body, notificationDetails);
  //   });

  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('Mensaje abierto: $message');

  //     // Navegar a una pantalla específica en la aplicación en función del contenido del mensaje
  //   });
  // }
}
