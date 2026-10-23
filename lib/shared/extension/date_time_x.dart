import 'package:intl/intl.dart';

extension DateTimeX on DateTime? {
  String? get toFormat {
    if (this == null) return null;
    return DateFormat('MMMM dd, yyyy', 'en_US').format(this!);
  }

  bool get isInCooldown {
    if (this == null) return false;

    final difference = DateTime.now().difference(this!);
    return difference.inDays < 30;
  }
}
