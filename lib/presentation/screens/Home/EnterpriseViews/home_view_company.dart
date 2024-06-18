// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/LoginWidgets/LoginScreens.dart';
import '../../RegisterScreens/RegisterScreens.dart';
import '../../../widgets/HomePage/General/bottom_navigator.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(
        isEnterprise: true,
      ),
      appBar: AppBar(
        title: const Text('Company Home Screen'),
      ),
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
                      disabled: false,
                      onTap: () async {
                        await FirebaseServices().googleSignOut();
                        context.go('/JcWelcomeScreen');
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
