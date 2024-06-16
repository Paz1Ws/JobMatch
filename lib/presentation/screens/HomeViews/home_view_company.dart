import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/presentation/screens/Redirect/Jc_welcome.dart';
import '../../widgets/LoginWidgets/LoginScreens.dart';
import '../RegisterScreens/RegisterScreens.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
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
