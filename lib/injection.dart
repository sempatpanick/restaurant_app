import 'package:get_it/get_it.dart';
import 'package:restaurant_app/presentation/provider/menu_notifier.dart';
import 'package:restaurant_app/presentation/provider/utils_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => UtilsNotifier(),
  );
  locator.registerFactory(
    () => MenuNotifier(),
  );

  // use cases

  // repository

  // data sources

  // helper

  // external
}
