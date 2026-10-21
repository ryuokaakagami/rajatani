extension StringX on String {
  String get normalizePhone {
    if (startsWith('0')) {
      return '62${substring(1)}';
    }
    return this;
  }

  String get asMention => '@$this';

  String get toCleanSpace {
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}

extension NullableStringX on String? {
  String orFallback([String alternative = 'Not set']) {
    if (this == null || this!.trim().isEmpty) return alternative;
    return this!;
  }
}
