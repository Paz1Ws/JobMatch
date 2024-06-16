import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/Redirect/Jc_welcome.dart';
import '../../widgets/LoginWidgets/LoginScreens.dart';
import '../RegisterScreens/RegisterScreens.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome User',
                      style: TextStyle(fontSize: 24),
                    ),
                    MyButtons(
                      onTap: () async {
                        await FirebaseServices().googleSignOut();
                        await FirebaseServices().auth.signOut();
                        Navigator.of(context).pop(
                          MaterialPageRoute(
                            builder: (context) => const JcWelcomeScreen(),
                          ),
                        );
                      },
                      text: "Log Out",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
