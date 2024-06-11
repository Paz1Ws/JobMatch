import 'package:flutter/material.dart';
import '../../widgets/LoginWidgets/LoginScreens.dart';
import '../RegisterScreens/RegisterScreens.dart';

class ScreenUser extends StatefulWidget {
  const ScreenUser({super.key});

  @override
  _ScreenUserState createState() => _ScreenUserState();
}

class _ScreenUserState extends State<ScreenUser> {
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
                      'Welcome Company',
                      style: TextStyle(fontSize: 24),
                    ),
                    MyButtons(
                      onTap: () async {
                        await FirebaseServices().googleSignOut();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
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
