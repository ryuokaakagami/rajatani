import '../constants/username_policy.dart';

extension UsernameX on DateTime? {
  bool get isInCooldown {
    final updatedAt = this;
    if (updatedAt == null) return false;
    return DateTime.now().difference(updatedAt) < UsernamePolicy.cooldown;
  }
}
