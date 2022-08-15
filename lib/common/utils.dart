import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

String numberPattern(int value) {
  var f = NumberFormat.decimalPattern('id');
  return f.format(value);
}
