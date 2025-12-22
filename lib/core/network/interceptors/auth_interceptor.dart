import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Interceptor for adding authentication tokens to requests
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    this.getToken,
    this.getTokenAsync,
    this.onTokenExpired,
    this.onTokenExpiredAsync,
  });

  /// Callback to get the current authentication token (synchronous)
  /// Deprecated: Use getTokenAsync instead for async storage
  @Deprecated('Use getTokenAsync for async token retrieval')
  final String? Function()? getToken;

  /// Callback to get the current authentication token (asynchronous)
  final Future<String?> Function()? getTokenAsync;

  /// Callback when token is expired (401 response)
  /// Can be synchronous (VoidCallback) or asynchronous (Future<void> Function())
  final VoidCallback? onTokenExpired;
  final Future<void> Function()? onTokenExpiredAsync;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token;

    // Try async first (preferred for storage)
    if (getTokenAsync != null) {
      token = await getTokenAsync!();
    } else if (getToken != null) {
      // Fallback to sync for backward compatibility
      token = getToken!();
    }

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - token expired
    if (err.response?.statusCode == 401) {
      if (onTokenExpiredAsync != null) {
        // Execute async callback without blocking
        onTokenExpiredAsync!();
      } else {
        onTokenExpired?.call();
      }
    }
    super.onError(err, handler);
  }
}
