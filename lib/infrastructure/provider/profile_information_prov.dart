import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

final change_page = ChangeNotifierProvider<ChangePage>((ref) => ChangePage());

class ChangePage extends ChangeNotifier {
  var changePage = 0;
  void setpage1() {
    changePage = 1;
    notifyListeners();
  }

  void setpage2() {
    changePage = 2;
    notifyListeners();
  }

  void setpage3() {
    changePage = 3;
    notifyListeners();
  }
}
