import 'package:flutter/material.dart';

import '../../domain/entities/menu.dart';

class MenuNotifier extends ChangeNotifier {
  int _categoryFoodIndex = 0;
  int get categoryFoodIndex => _categoryFoodIndex;

  int _bannerActiveIndex = 0;
  int get bannerActiveIndex => _bannerActiveIndex;

  final List<Menu> _menus = <Menu>[];
  List<Menu> get menus => _menus;

  final List<String> _category = [
    "Recommended",
    "Popular",
    "Sushi",
    "Ramen",
    "Donburi",
    "Tempura",
    "Drink",
  ];

  List<String> get category => _category;

  final List<Menu> _menuRecommended = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
    const Menu(id: 3, name: 'Ebi Ramen', status: 0, price: 22000, image: ''),
    const Menu(id: 4, name: 'Edamame', status: 1, price: 10000, image: ''),
    const Menu(id: 5, name: 'Dory', status: 1, price: 25000, image: ''),
    const Menu(id: 6, name: 'Sashimi', status: 1, price: 25000, image: ''),
    const Menu(id: 7, name: 'Korya', status: 1, price: 25000, image: ''),
  ];

  final List<Menu> _menuPopular = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
    const Menu(id: 3, name: 'Ebi Ramen', status: 0, price: 22000, image: ''),
    const Menu(id: 4, name: 'Edamame', status: 1, price: 10000, image: ''),
    const Menu(id: 5, name: 'Dory', status: 1, price: 25000, image: ''),
    const Menu(id: 6, name: 'Sashimi', status: 1, price: 25000, image: ''),
  ];

  final List<Menu> _menuSushi = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
    const Menu(id: 3, name: 'Ebi Ramen', status: 0, price: 22000, image: ''),
    const Menu(id: 4, name: 'Edamame', status: 1, price: 10000, image: ''),
    const Menu(id: 5, name: 'Dory', status: 1, price: 25000, image: ''),
  ];

  final List<Menu> _menuRamen = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
    const Menu(id: 3, name: 'Ebi Ramen', status: 0, price: 22000, image: ''),
    const Menu(id: 4, name: 'Edamame', status: 1, price: 10000, image: ''),
  ];

  final List<Menu> _menuDonburi = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
    const Menu(id: 3, name: 'Ebi Ramen', status: 0, price: 22000, image: ''),
  ];

  final List<Menu> _menuTempura = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
    const Menu(id: 2, name: 'Todoroki', status: 1, price: 15000, image: ''),
  ];

  final List<Menu> _menuDrink = [
    const Menu(id: 1, name: 'Takoyaki', status: 1, price: 10000, image: ''),
  ];

  bool setCategoryFoodIndex(int index) {
    if (_categoryFoodIndex == index) {
      return false;
    }
    _categoryFoodIndex = index;
    getMenu(index);

    return true;
  }

  void getMenu(int index) {
    _menus.clear();
    if (index == 0) {
      _menus.addAll(_menuRecommended);
    } else if (index == 1) {
      _menus.addAll(_menuPopular);
    } else if (index == 2) {
      _menus.addAll(_menuSushi);
    } else if (index == 3) {
      _menus.addAll(_menuRamen);
    } else if (index == 4) {
      _menus.addAll(_menuDonburi);
    } else if (index == 5) {
      _menus.addAll(_menuTempura);
    } else if (index == 6) {
      _menus.addAll(_menuDrink);
    }
    notifyListeners();
  }

  void setBannerActiveIndex(int index) {
    _bannerActiveIndex = index;
    notifyListeners();
  }
}
