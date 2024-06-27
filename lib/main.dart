import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_match_app/config/Languajes/provider.dart';
import 'package:job_match_app/config/router/go_router.dart';
import 'package:job_match_app/config/theme/theme.dart';
import 'package:job_match_app/infrastructure/services/Notifications/firebase_api.dart';
import 'package:job_match_app/infrastructure/services/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:job_match_app/config/Languajes/l10n/l10n.dart'; // Import the necessary package

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseApi().initNotification();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // Procesa el mensaje recibido
    print('Recibido: ${message.notification?.title}');
    print('Cuerpo: ${message.notification?.body}');

    // Si la aplicación está en primer plano, muestra la notificación
    if (Platform.isAndroid) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      var notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails('channel_id', 'channel_name',
              importance: Importance.high,
              priority: Priority.high,
              icon: 'app_icon'));
      flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, notificationDetails);
    }
  });
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale.locale,
      supportedLocales: L10n.all,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness:
            theme.globalBrightnessisDark ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.blue),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
