part of '../app_exception.dart';

class StorageForbiddenException extends AppException {
  const new() : super(message: 'You are not allowed to upload this file.');
}

class FileTooLargeException extends AppException {
  const new() : super(message: 'File is too large.');
}

class FileNotFoundStorageException extends AppException {
  const new() : super(message: 'File not found in storage.');
}

class StorageServerException extends AppException {
  const new() : super(message: 'Storage server error. Please try again.');
}

class FileAlreadyExistsStorageException extends AppException {
  const new() : super(message: 'File already exists in storage.');
}
