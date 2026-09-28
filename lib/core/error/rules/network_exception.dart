part of '../app_exception.dart';

class NetworkException extends AppException {
  const new()
    : super(
        message: 'Tidak ada koneksi internet. Silakan periksa jaringan Anda.',
      );
}

class TimeOutException extends AppException {
  const new() : super(message: 'Waktu koneksi habis. Silakan coba lagi.');
}
