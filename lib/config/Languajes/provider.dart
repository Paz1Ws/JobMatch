import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/config/Languajes/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }

  clearLocale() {
    _locale = null;
    notifyListeners();
  }
}

final localeProvider = ChangeNotifierProvider<LocaleProvider>((ref) {
  return LocaleProvider();
});
