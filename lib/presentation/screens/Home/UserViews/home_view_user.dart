import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/infrastructure/provider/screen_index_provider.dart';
import 'package:job_match_app/presentation/screens/Home/UserViews/aplied_jobs.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/ProfileHome/main_profile.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/settings_profile.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/bottom_navigator.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/swipe_cards.dart';
import '../../../widgets/LoginWidgets/LoginScreens.dart';
import '../../RegisterScreens/RegisterScreens.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserScreenState();
  }
}

class _UserScreenState extends ConsumerState<UserScreen> {
  Color notification = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigator(
          isEnterprise: false,
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.black
              : Colors.grey.withOpacity(0.4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
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
              icon: Stack(
                children: [
                  const Icon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: notification,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  notification = Colors.red == notification
                      ? Colors.transparent
                      : Colors.red;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: IndexedStack(
            index: ref.watch(counterProvider),
            children: [
              const SwipeCards(),
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
              const AppliedJobs(
                numberOfJobs: 50,
              ),
              const MainProfileScreen(),
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
    );
  }
}
