import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';
import 'package:restaurant_app/presentation/widgets/item_category_widget.dart';

import '../../domain/entities/menu.dart';
import '../widgets/item_menu_list_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  final pageController = PageController(viewportFraction: 0.8, keepPage: true);
  var menus = <Menu>[];

  final List<String> _category = [
    "Recommended",
    "Popular",
    "Sushi",
    "Ramen",
    "Donburi",
    "Tempura",
    "Drink",
  ];

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

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          "Fujiyaki",
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 50,
              padding: const EdgeInsets.all(4.0),
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: colorBlack,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 70,
            ),
            Consumer<UtilsNotifier>(builder: (context, data, _) {
              int indexCategory = data.categoryFoodIndex;

              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 16.0),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                  itemCount: _category.length,
                  itemBuilder: (context, index) {
                    Color colorBackground = indexCategory == index ? primaryColor : colorWhite;
                    Color colorText = indexCategory == index ? colorWhite : colorBlack;

                    return ItemCategoryWidget(
                      name: _category[index],
                      colorBackground: colorBackground,
                      colorText: colorText,
                      onTap: () {
                        controller.reverse();
                        Future.delayed(const Duration(milliseconds: 300), () {
                          controller.forward();
                        });
                        data.setCategoryFoodIndex(index);
                      },
                    );
                  },
                ),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            Consumer<UtilsNotifier>(builder: (context, data, _) {
              menus.clear();
              if (data.categoryFoodIndex == 0) {
                menus.addAll(_menuRecommended);
              } else if (data.categoryFoodIndex == 1) {
                menus.addAll(_menuPopular);
              } else if (data.categoryFoodIndex == 2) {
                menus.addAll(_menuSushi);
              } else if (data.categoryFoodIndex == 3) {
                menus.addAll(_menuRamen);
              } else if (data.categoryFoodIndex == 4) {
                menus.addAll(_menuDonburi);
              } else if (data.categoryFoodIndex == 5) {
                menus.addAll(_menuTempura);
              } else if (data.categoryFoodIndex == 6) {
                menus.addAll(_menuDrink);
              }

              return SlideTransition(
                position: Tween(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).animate(controller),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 16.0),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16.0,
                  ),
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    var menu = menus[index];

                    return ItemMenuListViewWidget(menu: menu);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
