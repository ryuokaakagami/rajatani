import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum Gender {
  @JsonValue('male')
  male(value: 'male', label: 'Male'),

  @JsonValue('female')
  female(value: 'female', label: 'Female'),

  @JsonValue('not_to_say')
  notToSay(value: 'not_to_say', label: 'Prefer not to say');

  final String value;
  final String label;

  const new({required this.value, required this.label});

  static Gender? fromValue(String? value) {
    if (value == null) return null;
    return Gender.values.firstWhere((g) => g.value == value);
  }
}
