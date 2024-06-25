import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/config/router/go_router.dart';
import 'package:job_match_app/config/theme/theme.dart';
import 'package:job_match_app/infrastructure/services/Notifications/firebase_api.dart';
import 'package:job_match_app/infrastructure/services/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await FirebaseApi().initNotification();

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
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness:
            theme.globalBrightnessisDark ? Brightness.dark : Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          labelLarge:
              TextStyle(color: Colors.blue), // Change text color to blue
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
