import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/pages/cart_page.dart';
import 'package:restaurant_app/presentation/pages/profile_page.dart';

import '../../domain/entities/navigation_menu.dart';
import '../pages/home_page.dart';

class UtilsNotifier extends ChangeNotifier {
  int _bottomNavigationIndex = 0;
  int get bottomNavigationIndex => _bottomNavigationIndex;

  final List<NavigationMenu> _navigationMenu = [
    const NavigationMenu(icon: Icons.home, name: "Home", page: HomePage()),
    const NavigationMenu(icon: Icons.shopping_basket_outlined, name: "Cart", page: CartPage()),
    const NavigationMenu(icon: Icons.person, name: "Profile", page: ProfilePage()),
  ];

  List<NavigationMenu> get navigationMenu => _navigationMenu;

  void setBottomNavigationIndex(int index) {
    _bottomNavigationIndex = index;
    notifyListeners();
  }
}
