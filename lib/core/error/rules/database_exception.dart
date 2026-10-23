part of '../app_exception.dart';

// --- Database Exceptions ---
class DatabaseNotFoundException extends AppException {
  const new() : super(message: 'The requested data could not be found.');
}

class DatabasePermissionDeniedException extends AppException {
  const new()
    : super(message: 'You do not have permission to perform this action.');
}

class DatabaseDuplicateException extends AppException {
  const new() : super(message: 'This value is already in use.');
}

class DatabaseReferenceException extends AppException {
  const new()
    : super(
        message: 'This data is linked to other records and cannot be changed or removed.',
      );
}

class DatabaseInvalidDataException extends AppException {
  const new()
    : super(message: 'Some of the data provided is invalid or incomplete.');
}

class DatabaseSessionExpiredException extends AppException {
  const new()
    : super(message: 'Your session has expired. Please sign in again.');
}

// --- Username Exceptions ---
class UsernameTooShortException extends UsernameException {
  const new() : super(message: 'Username must be at least 3 characters.');
}

class UsernameInvalidCharactersException extends UsernameException {
  const new()
    : super(
        message: 'Username can only contain lowercase letters, numbers, underscores, and periods.',
      );
}

class UsernameAlreadyExistsException extends UsernameException {
  const new() : super(message: 'Username is already taken.');
}

class UsernameCooldownException extends UsernameException {
  const new()
    : super(
        message: 'Username can only be changed once every 30 days. Please try again later.',
      );
}
