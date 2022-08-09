import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/pages/responsive/main_page/main_page_phone.dart';
import 'package:restaurant_app/presentation/pages/responsive/main_page/main_page_tablet.dart';

class MainPage extends StatelessWidget {
  static const String routeName = '/main_page';
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (size.width <= 700) {
      return const MainPagePhone();
    }
    return const MainPageTablet();
  }
}
