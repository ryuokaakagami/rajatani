import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get toFormat {
    return DateFormat('MMMM dd, yyyy', 'en_US').format(this);
  }
}
