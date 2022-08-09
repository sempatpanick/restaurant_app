import 'package:intl/intl.dart';

String numberPattern(int value) {
  var f = NumberFormat.decimalPattern('id');
  return f.format(value);
}
