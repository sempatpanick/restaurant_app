import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/presentation/pages/cart_page.dart';
import 'package:restaurant_app/presentation/pages/home_page.dart';
import 'package:restaurant_app/presentation/pages/profile_page.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main_page';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<IconData> _iconList = [
    Icons.home,
    Icons.shopping_basket_outlined,
    Icons.person,
  ];

  final List<String> _iconName = [
    "Home",
    "Cart",
    "Profile",
  ];

  final _iconPage = [
    HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilsNotifier>(builder: (context, data, _) {
      int indexBottomNav = data.bottomNavigationIndex;

      return Scaffold(
        backgroundColor: colorGrey,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: _iconList.length,
          tabBuilder: (int index, bool isActive) {
            Color colorBottomNav = isActive ? secondaryColor : colorBlack;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _iconList[index],
                  color: colorBottomNav,
                ),
                Text(
                  _iconName[index],
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: colorBottomNav,
                        fontWeight: FontWeight.w400,
                      ),
                )
              ],
            );
          },
          activeIndex: indexBottomNav,
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.defaultEdge,
          leftCornerRadius: 20,
          rightCornerRadius: 20,
          onTap: (index) => data.setBottomNavigationIndex(index),
        ),
        body: _iconPage[indexBottomNav],
      );
    });
  }
}
