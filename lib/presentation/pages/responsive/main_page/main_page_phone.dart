import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/domain/entities/navigation_menu.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';

import '../../../../common/constants.dart';

class MainPagePhone extends StatelessWidget {
  const MainPagePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilsNotifier>(builder: (context, data, _) {
      int indexBottomNav = data.bottomNavigationIndex;
      List<NavigationMenu> navigationMenu = data.navigationMenu;

      return Scaffold(
        backgroundColor: colorGrey,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: navigationMenu.length,
          tabBuilder: (int index, bool isActive) {
            Color colorBottomNav = isActive ? primaryColor : colorBlack;

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  navigationMenu[index].icon,
                  color: colorBottomNav,
                ),
                Text(
                  navigationMenu[index].name,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
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
          onTap: (index) => Provider.of<UtilsNotifier>(context, listen: false)
              .setBottomNavigationIndex(index),
        ),
        body: navigationMenu[indexBottomNav].page,
      );
    });
  }
}
