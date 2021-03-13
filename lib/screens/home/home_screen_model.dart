import 'package:flutter/material.dart';

class HomeScreenModel extends ChangeNotifier {
  HomeScreenModel();

  int currentIndex = 0;

  void onTabTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
