extension MaskedX on String {
  String get toMaskEmail {
    final parts = split('@');

    if (parts.length != 2) return this;

    final name = parts.first;
    final domain = parts.last;

    if (name.length <= 3) return '$name@$domain';

    final visibleName = name.substring(0, 3);
    final masked = '*' * (name.length - 3);

    return '$visibleName$masked@$domain';
  }

  String get toMaskPhone {
    if (length < 9) return this;

    final firstVisibale = substring(0, 5);
    final lastVisible = substring(length - 2, length);

    final masked = '*' * (length - 7);
    return '$firstVisibale$masked$lastVisible';
  }
}
