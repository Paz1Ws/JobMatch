import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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

  // Run your app
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return ScreenLoader(userData: snapshot.hasData);
        },
      ),
    );
  }
}
