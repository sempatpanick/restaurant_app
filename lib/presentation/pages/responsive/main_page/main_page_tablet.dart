import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';

import '../../../../common/constants.dart';
import '../../../../domain/entities/navigation_menu.dart';

class MainPageTablet extends StatelessWidget {
  const MainPageTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<UtilsNotifier>(builder: (context, data, _) {
      int indexBottomNav = data.bottomNavigationIndex;
      List<NavigationMenu> navigationMenu = data.navigationMenu;

      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: indexBottomNav,
              backgroundColor: colorWhite,
              extended: size.width >= 900 ? true : false,
              useIndicator: true,
              indicatorColor: primaryColor,
              elevation: 1,
              labelType: size.width >= 900
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.all,
              onDestinationSelected: (index) =>
                  Provider.of<UtilsNotifier>(context, listen: false)
                      .setBottomNavigationIndex(index),
              selectedIconTheme: const IconThemeData(color: colorWhite),
              leading: const SizedBox(
                height: 24,
              ),
              destinations: navigationMenu.map((menu) {
                return NavigationRailDestination(
                  icon: Icon(menu.icon),
                  label: Text(
                    menu.name,
                    style: size.width >= 900
                        ? Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: colorBlack,
                              fontWeight: FontWeight.w600,
                            )
                        : Theme.of(context).textTheme.labelMedium!.copyWith(
                              color: colorBlack,
                              fontWeight: FontWeight.w600,
                            ),
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: navigationMenu[indexBottomNav].page,
            ),
          ],
        ),
      );
    });
  }
}
