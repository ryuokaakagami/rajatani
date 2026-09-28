part 'rules/auth_exception.dart';
part 'rules/network_exception.dart';

abstract class AppException {
  final String message;

  const new({required this.message});
}

class UnknownException extends AppException {
  const new() : super(message: 'Something went wrong. Please try again.');
}
