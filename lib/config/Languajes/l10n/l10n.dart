import 'dart:ui';

class L10n {
  static const all = [
    Locale('en', 'US'),
    Locale('es', 'ES'),
  ];
  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇦🇪';
      case 'hi':
        return '🇮🇳';
      case 'es':
        return '🇪🇸';
      case 'de':
        return '🇩🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}
