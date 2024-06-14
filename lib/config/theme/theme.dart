import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider<AppTheme>((ref) {
  return AppTheme();
});

class AppTheme extends ChangeNotifier {
  var globalBrightnessisDark = false;
  void setLightTheme() {
    globalBrightnessisDark = false;
    notifyListeners();
  }

  void setDarkTheme() {
    globalBrightnessisDark = true;
    notifyListeners();
  }
}
