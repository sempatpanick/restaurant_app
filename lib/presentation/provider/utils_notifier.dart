import 'package:flutter/material.dart';

class UtilsNotifier extends ChangeNotifier {
  int _bottomNavigationIndex = 0;
  int get bottomNavigationIndex => _bottomNavigationIndex;

  int _categoryFoodIndex = 0;
  int get categoryFoodIndex => _categoryFoodIndex;

  void setBottomNavigationIndex(int index) {
    _bottomNavigationIndex = index;
    notifyListeners();
  }

  void setCategoryFoodIndex(int index) {
    _categoryFoodIndex = index;
    notifyListeners();
  }
}
