part 'rules/auth_exception.dart';
part 'rules/network_exception.dart';
part 'rules/database_exception.dart';
part 'rules/storage_exception.dart';

abstract class AppException {
  final String message;

  const new({required this.message});
}

class UnknownException extends AppException {
  const new() : super(message: 'Something went wrong. Please try again.');
}

abstract class UsernameException extends AppException {
  const UsernameException({required super.message});
}

class ImageConversionException extends AppException {
  const new()
    : super(message: 'Failed to process the image. Please try another photo.');
}
