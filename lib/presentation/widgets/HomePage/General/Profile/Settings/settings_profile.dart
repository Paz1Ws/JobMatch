import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations.dart';
import 'package:job_match_app/config/theme/theme.dart';
import 'package:job_match_app/infrastructure/provider/screen_index_provider.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/edit_account_screen.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/forward_button.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/setting_item.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/Profile/Settings/setting_switch.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AccountScreenState();
  }
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppLocalizations.of(context)?.ajustes}',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '${AppLocalizations.of(context)?.cuenta}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        width: 3,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/JobMatch.png",
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Job Match",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${AppLocalizations.of(context)?.laMagiaDelEmparejamientoLaboral}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  ForwardButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditAccountScreen(),
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 40),
              Text(
                '${AppLocalizations.of(context)?.preferencias}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: '${AppLocalizations.of(context)?.idioma}',
                icon: Ionicons.language,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                value: "Spanish",
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: '${AppLocalizations.of(context)?.notificaciones}',
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingSwitch(
                title: '${AppLocalizations.of(context)?.modoOscuro}',
                icon: Theme.of(context).brightness == Brightness.dark
                    ? Ionicons.moon
                    : Ionicons.sunny,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                value: false,
                onTap: (value) {
                  setState(() {
                    ref.read(themeProvider.notifier).globalBrightnessisDark ==
                            false
                        ? ref.read(themeProvider.notifier).setDarkTheme()
                        : ref.read(themeProvider.notifier).setLightTheme();
                  });
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: '${AppLocalizations.of(context)?.privacidad}',
                icon: Ionicons.lock_closed,
                bgColor: Colors.green.shade100,
                iconColor: Colors.green,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: '${AppLocalizations.of(context)?.acercaDe}',
                icon: Ionicons.information_circle,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: '${AppLocalizations.of(context)?.cerrarSesion}',
                icon: Ionicons.log_out,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  ref.watch(counterProvider.notifier).update((state) => 0);
                  context.go('/JcWelcomeScreen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
