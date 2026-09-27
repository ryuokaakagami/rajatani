extension StringX on String {
  String get toNormalizePhone {
    if (startsWith('0')) {
      return '62${substring(1)}';
    }
    return this;
  }
}
