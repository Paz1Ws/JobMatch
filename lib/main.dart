import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/config/router/go_router.dart';
import 'package:job_match_app/config/theme/theme.dart';
import 'package:job_match_app/presentation/screens/LoaderScreen/loader_screen.dart';

Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyBES7yl9EZ5UIQ2Ubz_u0YKJuJ_ZljKgaw',
    appId: 'com.example.job_match_app',
    messagingSenderId: 'sendid',
    projectId: 'jobmatchdb',
    storageBucket: 'jobmatchdb.appspot.com',
  ));

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
      theme:
          theme.globalBrightnessisDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
