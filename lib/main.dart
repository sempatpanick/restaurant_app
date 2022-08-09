import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/injection.dart' as di;
import 'package:restaurant_app/presentation/pages/main_page.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';

import 'common/constants.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<UtilsNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Restaurant App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
      ),
    );
  }
}
