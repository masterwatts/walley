import 'package:intl/intl.dart';

class TimeUtil {
  static DateTime now() => DateTime.now();
  static ofFormat(String formatting) => DateFormat(formatting).format(now());
}
