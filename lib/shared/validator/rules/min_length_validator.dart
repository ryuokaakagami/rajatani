import '../../shared.dart';

class MinLengthValidator implements FieldValidator {
  final String fieldName;
  final int length;

  new({required this.fieldName, required this.length});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < length) {
      return '$fieldName must be at least $length characters';
    }
    return null;
  }
}
