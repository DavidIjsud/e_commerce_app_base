import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:e_commerce_app_base/core/network/interceptors/interceptors.dart';

/// DIO HTTP client configuration
///
/// This class provides a configured DIO instance with interceptors
/// for authentication, logging, and error handling.
class DioClient {
  /// Creates a configured DIO instance
  ///
  /// [baseUrl] The base URL for the API
  /// [getToken] Optional callback to get authentication token (synchronous)
  /// [getTokenAsync] Optional callback to get authentication token (asynchronous)
  /// [onTokenExpired] Optional callback when token expires (synchronous)
  /// [onTokenExpiredAsync] Optional callback when token expires (asynchronous)
  /// [enableLogging] Whether to enable request/response logging (default: true)
  /// [connectTimeout] Connection timeout in milliseconds (default: 30000)
  /// [receiveTimeout] Receive timeout in milliseconds (default: 30000)
  /// [sendTimeout] Send timeout in milliseconds (default: 30000)
  static Dio create(
    String baseUrl, {
    String? Function()? getToken,
    Future<String?> Function()? getTokenAsync,
    VoidCallback? onTokenExpired,
    Future<void> Function()? onTokenExpiredAsync,
    bool enableLogging = true,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
  }) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout ?? const Duration(seconds: 30),
        receiveTimeout: receiveTimeout ?? const Duration(seconds: 30),
        sendTimeout: sendTimeout ?? const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors in order
    // 1. Logging (first to log everything)
    if (enableLogging) {
      dio.interceptors.add(LoggingInterceptor());
    }

    // 2. Authentication (adds token to requests)
    dio.interceptors.add(
      AuthInterceptor(
        getToken: getToken,
        getTokenAsync: getTokenAsync,
        onTokenExpired: onTokenExpired,
        onTokenExpiredAsync: onTokenExpiredAsync,
      ),
    );

    // 3. Error handling (transforms errors to custom exceptions)
    dio.interceptors.add(ErrorInterceptor());

    return dio;
  }
}
