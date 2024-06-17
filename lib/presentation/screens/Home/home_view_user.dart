import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/infrastructure/provider/screen_index_provider.dart';
import 'package:job_match_app/presentation/widgets/HomePage/SwipeView/bottom_navigator.dart';
import 'package:job_match_app/presentation/widgets/HomePage/SwipeView/swipe_cards.dart';
import 'package:job_match_app/presentation/widgets/theme_button.dart';
import '../../widgets/LoginWidgets/LoginScreens.dart';
import '../RegisterScreens/RegisterScreens.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends ConsumerState<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigator(),
      appBar: AppBar(
        actions: [
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Image.asset(
                'assets/images/JobMatch.png',
                height: 100,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.comment),
            onPressed: () {
              context.go('/chat');
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(FontAwesomeIcons.bell),
            onPressed: () {
              context.go('/notifications');
            },
          ),
        ],
      ),
      body: Center(
        child: IndexedStack(
          index: ref.watch(counterProvider),
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
                      disabled: false,
                      onTap: () async {
                        await FirebaseServices().googleSignOut();
                        await FirebaseServices().auth.signOut();
                        context.go('/JcWelcomeScreen');
                      },
                      text: "Log Out",
                    ),
                  ],
                ),
              ),
            ),
            const Example(),
            MyButtons(
              disabled: false,
              onTap: () async {
                await FirebaseServices().googleSignOut();
                await FirebaseServices().auth.signOut();
                context.go('/JcWelcomeScreen');
              },
              text: "Log Out",
            ),
          ],
        ),
      ),
    );
  }
}
