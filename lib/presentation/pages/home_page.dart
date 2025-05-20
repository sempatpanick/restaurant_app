import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/presentation/provider/menu_notifier.dart';
import 'package:restaurant_app/presentation/widgets/item_category_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/item_menu_list_view_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animateListController;
  late Animation<double> animation;
  final bannerController =
      PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    animateListController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animateListController);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      animateListController.forward();
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    animateListController.dispose();
    bannerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: colorGrey,
      appBar: AppBar(
        backgroundColor: colorWhite,
        title: Text(
          "Fujiyaki",
          style: theme.textTheme.titleLarge!.copyWith(
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
              margin:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
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
              height: 40,
            ),
            Consumer<MenuNotifier>(builder: (context, data, _) {
              return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: bannerController,
                      onPageChanged: (index) =>
                          data.setBannerActiveIndex(index),
                      itemCount: 6,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.hardEdge,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://dummyimage.com/500x250/FFC532/fff.jpg",
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SmoothPageIndicator(
                    controller: bannerController,
                    count: 6,
                    effect: const WormEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: primaryColor,
                      dotColor: colorGreyDark,
                    ),
                    onDotClicked: (index) => bannerController
                        .animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        )
                        .whenComplete(() => data.setBannerActiveIndex(index)),
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 40,
            ),
            Consumer<MenuNotifier>(builder: (context, data, _) {
              int indexCategory = data.categoryFoodIndex;
              data.getMenu(indexCategory);

              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemCount: data.category.length,
                  itemBuilder: (context, index) {
                    Color colorBackground =
                        indexCategory == index ? primaryColor : colorWhite;
                    Color colorText =
                        indexCategory == index ? colorWhite : colorBlack;

                    return ItemCategoryWidget(
                      name: data.category[index],
                      colorBackground: colorBackground,
                      colorText: colorText,
                      onTap: () async {
                        if (data.setCategoryFoodIndex(index)) {
                          animateListController.reverse().whenComplete(
                              () => animateListController.forward());
                        }
                      },
                    );
                  },
                ),
              );
            }),
            const SizedBox(
              height: 30,
            ),
            Consumer<MenuNotifier>(builder: (context, data, _) {
              return FadeTransition(
                opacity: animation,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.only(
                      left: 28.0, right: 28.0, bottom: 16.0),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16.0,
                  ),
                  itemCount: data.menus.length,
                  itemBuilder: (context, index) {
                    var menu = data.menus[index];

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
