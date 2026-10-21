part of '../app_exception.dart';

class NetworkException extends AppException {
  const new()
    : super(message: 'No internet connection. Please check your network.');
}

class TimeOutException extends AppException {
  const new() : super(message: 'Connection timed out. Please try again.');
}
