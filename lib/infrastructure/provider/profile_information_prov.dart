import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

final change_page =
    ChangeNotifierProvider<ChangePage>((ref) => ChangePage(changePage: 0));

class ChangePage extends ChangeNotifier {
  int changePage;

  ChangePage({required this.changePage});
  void changePageMethod(int page) {
    changePage = page;
    notifyListeners();
  }
}

final change_page_valid = ChangeNotifierProvider<ChangePageValid>(
    (ref) => ChangePageValid(changepageValid: false));

class ChangePageValid extends ChangeNotifier {
  bool changepageValid;

  ChangePageValid({required this.changepageValid});
  void changePageValidMethod(bool page) {
    changepageValid = page;
    notifyListeners();
  }
}
