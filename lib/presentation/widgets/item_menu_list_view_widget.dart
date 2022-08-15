import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/common/constants.dart';
import 'package:restaurant_app/common/utils.dart';
import 'package:restaurant_app/domain/entities/menu.dart';

import '../pages/detail_menu_page.dart';

class ItemMenuListViewWidget extends StatefulWidget {
  final Menu menu;
  const ItemMenuListViewWidget({Key? key, required this.menu}) : super(key: key);

  @override
  State<ItemMenuListViewWidget> createState() => _ItemMenuListViewWidgetState();
}

class _ItemMenuListViewWidgetState extends State<ItemMenuListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, DetailMenuPage.routeName),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: SizedBox.fromSize(
                size: const Size(110, 110),
                child: CachedNetworkImage(
                  imageUrl: "https://dummyimage.com/400x400/FFC532/fff.jpg",
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    widget.menu.name,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  if (widget.menu.status == 0)
                    const SizedBox(
                      height: 4.0,
                    ),
                  if (widget.menu.status == 0)
                    Text(
                      "Not in sale",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: colorRed,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    numberPattern(widget.menu.price),
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: colorBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
