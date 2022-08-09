import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/injection.dart' as di;
import 'package:restaurant_app/presentation/pages/main_page.dart';
import 'package:restaurant_app/presentation/provider/menu_notifier.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';
import 'package:window_size/window_size.dart';

import 'common/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Restaurant App');
    setWindowMinSize(const Size(350, 500));
    setWindowMaxSize(Size.infinite);
  }

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
        ChangeNotifierProvider(
          create: (_) => di.locator<MenuNotifier>(),
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
