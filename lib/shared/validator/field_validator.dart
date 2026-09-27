abstract class FieldValidator {
  String? validate(String? value);
}

class CompositeValidator {
  final List<FieldValidator> validators;

  const new({required this.validators});

  String? call(String? value) {
    for (final validator in validators) {
      final error = validator.validate(value);
      if (error != null && error.isNotEmpty) return error;
    }
    return null;
  }
}
