import 'package:flutter/material.dart';
import 'package:restaurant_app/common/constants.dart';

import '../../common/lorem_ipsum.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../widgets/custom_image_detail_menu_widget.dart';
import '../widgets/text_with_icon_widget.dart';

class DetailMenuPage extends StatelessWidget {
  static const String routeName = '/detail_menu_page';
  const DetailMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colorWhite,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: colorYellow,
              child: Stack(
                children: [
                  CustomAppBarWidget(
                    trailingWidget: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: colorBlack,
                          ),
                        ),
                      ),
                    ),
                    actionWidget: GestureDetector(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: colorBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const CustomImageDetailMenuWidget(
                    image: "https://dummyimage.com/400x400/E96164FF/fff.jpg",
                  ),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                        child: Text(
                          "Soba Soup With Shrimp and Greens",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6!.copyWith(
                                color: colorBlack,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextWithIcon(
                            icon: Icon(
                              Icons.access_time,
                              color: colorBlue,
                            ),
                            text: "50 min",
                          ),
                          TextWithIcon(
                            icon: Icon(
                              Icons.star_border_outlined,
                              color: colorYellow,
                            ),
                            text: "4.7",
                          ),
                          TextWithIcon(
                            icon: Icon(
                              Icons.local_fire_department_outlined,
                              color: colorRed,
                            ),
                            text: "325 cal",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorGrey,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                "30.000",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: colorBlack, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(50, 40),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      "-",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: colorBlack, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: colorWhite,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "1",
                                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                            color: colorBlack, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      minimumSize: const Size(50, 40),
                                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                    child: Text(
                                      "+",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(color: colorBlack, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      loremIpsum,
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: colorGreyDark,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
