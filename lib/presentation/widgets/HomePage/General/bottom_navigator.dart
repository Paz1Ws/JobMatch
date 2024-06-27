import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_match_app/infrastructure/provider/screen_index_provider.dart';

// ignore: must_be_immutable
class BottomNavigator extends ConsumerStatefulWidget {
  bool isEnterprise;
  int index;
  BottomNavigator({
    this.index = 0,
    required this.isEnterprise,
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _BottomNavigatorState();
  }
}

class _BottomNavigatorState extends ConsumerState<BottomNavigator> {
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
          duration: const Duration(milliseconds: 250),
          tabBorderRadius: 20,
          backgroundColor: Colors.grey.withOpacity(0.1),
          gap: 5,
          selectedIndex: ref.watch(counterProvider),
          tabs: [
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 0);
              },
              icon: Icons.home,
              text: '${AppLocalizations.of(context)?.inicio}',
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
              text: '${AppLocalizations.of(context)?.buscar}',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor: ref.watch(counterProvider) == 0
                  ? _unselectedColor
                  : Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 2);
              },
              icon:
                  widget.isEnterprise ? Icons.work : FontAwesomeIcons.briefcase,
              text: widget.isEnterprise
                  ? 'Add Job'
                  : '${AppLocalizations.of(context)?.trabajos}',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor: ref.watch(counterProvider) == 0
                  ? _unselectedColor
                  : Colors.black,
              backgroundColor: Colors.deepOrange,
            ),
            GButton(
              onPressed: () {
                ref.read(counterProvider.notifier).update((state) => 3);
              },
              icon: Icons.person,
              text: '${AppLocalizations.of(context)?.perfil}',
              iconColor: textColor,
              textColor: textColor,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              iconActiveColor: ref.watch(counterProvider) == 0
                  ? _unselectedColor
                  : Colors.black,
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
