import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_match_app/infrastructure/provider/screen_index_provider.dart';

class BottomNavigator extends ConsumerStatefulWidget {
  // final VoidCallback onPressed;
  const BottomNavigator({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends ConsumerState<BottomNavigator> {
  int _selectedIndex = 0;
  final Color _unselectedColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 9, right: 9),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GNav(
          tabBorderRadius: 20,
          backgroundColor: Colors.grey,
          gap: 5,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 0);
              },
              icon: Icons.home,
              text: 'Home',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor: Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 1);
              },
              icon: Icons.search,
              text: 'Search',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor:
                  _selectedIndex == 0 ? _unselectedColor : Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 2);
              },
              icon: FontAwesomeIcons.briefcase,
              text: 'Jobs',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor:
                  _selectedIndex == 0 ? _unselectedColor : Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 3);
              },
              icon: Icons.person,
              text: 'Profile',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor:
                  _selectedIndex == 0 ? _unselectedColor : Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 4);
              },
              icon: FontAwesomeIcons.crown,
              text: ' Premium',
              iconColor: const Color.fromARGB(255, 255, 208, 0),
              textColor: textColor,
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor: const Color.fromARGB(255, 255, 208, 0),
              backgroundColor: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}
