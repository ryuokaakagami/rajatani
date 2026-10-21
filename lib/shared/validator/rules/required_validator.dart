import '../field_validator.dart';

class RequiredValidator implements FieldValidator {
  final String? fieldName;

  const new({required this.fieldName});

  @override
  String? validate(String? value) {
    if (value == null || value.isEmpty) return '$fieldName is required';
    return null;
  }
}
