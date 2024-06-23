import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../config/theme/theme.dart';

class ThemeButton extends ConsumerWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final theme = ref.watch(themeProvider);
    return IconButton(
      iconSize: 30,
      onPressed: () {
        ref.read(themeProvider.notifier).globalBrightnessisDark
            ? theme.setLightTheme()
            : theme.setDarkTheme();
      },
      icon: ref.watch(themeProvider.notifier).globalBrightnessisDark
          ? const Icon(Icons.light_mode)
          : const Icon(Icons.dark_mode),
    );
  }
}
