part of '../app_exception.dart';

class DatabaseNotFoundException extends AppException {
  const DatabaseNotFoundException()
    : super(message: 'The requested data could not be found.');
}

class DatabasePermissionDeniedException extends AppException {
  const DatabasePermissionDeniedException()
    : super(message: 'You do not have permission to perform this action.');
}

class DatabaseDuplicateException extends AppException {
  const DatabaseDuplicateException()
    : super(message: 'This value is already in use.');
}

class DatabaseReferenceException extends AppException {
  const DatabaseReferenceException()
    : super(
        message: 'This data is linked to other records and cannot be changed or removed.',
      );
}

class DatabaseInvalidDataException extends AppException {
  const DatabaseInvalidDataException()
    : super(message: 'Some of the data provided is invalid or incomplete.');
}

class DatabaseSessionExpiredException extends AppException {
  const DatabaseSessionExpiredException()
    : super(message: 'Your session has expired. Please sign in again.');
}
