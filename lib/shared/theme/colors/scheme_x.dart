part of 'scheme.dart';

class SchemeX extends ThemeExtension<SchemeX> {
  final Scheme scheme;

  new({required this.scheme});

  @override
  ThemeExtension<SchemeX> copyWith({Scheme? scheme}) {
    return SchemeX(scheme: scheme ?? this.scheme);
  }

  @override
  ThemeExtension<SchemeX> lerp(
    covariant ThemeExtension<SchemeX>? other,
    double t,
  ) {
    if (other is! SchemeX) return this;
    return SchemeX(scheme: Scheme.lerp(scheme, other.scheme, t));
  }
}
