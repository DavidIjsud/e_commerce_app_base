import 'package:e_commerce_app_base/core/network/exceptions/api_exception.dart';

/// Exception for network-related errors (no internet, timeout, etc.)
class NetworkException extends ApiException {
  const NetworkException(super.message, [super.statusCode]);

  /// No internet connection
  factory NetworkException.noInternet() {
    return const NetworkException(
      'No internet connection. Please check your network settings.',
    );
  }

  /// Request timeout
  factory NetworkException.timeout() {
    return const NetworkException(
      'Request timeout. Please try again later.',
    );
  }

  /// Connection error
  factory NetworkException.connectionError() {
    return const NetworkException(
      'Connection error. Please check your internet connection.',
    );
  }
}



